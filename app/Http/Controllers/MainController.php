<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Pedidos;
use App\Models\Pedidos_Imagem;
use App\Models\Clientes;
use App\Helpers\Funcao;
use Image;

class MainController extends Controller
{
    public function index(){
        return view('index'); 
    }
    public function painel_index(){
        return view('painel.index'); 
    }
    
    public function painel_post(request $request, $pagina){
        switch($pagina){  
            case "clientes": 
                $post = new Clientes;  
                $post->nome = $request->nome;
                $post->cpf = $request->cpf; 
                $post->data_nascimento = $request->data_nascimento; 
                $post->telefone = $request->telefone;
                $post->ativo = 1;
                $post->save(); 
            break;
            case "pedidos": 
                $post = new Pedidos;  
                $post->produto = $request->produto;
                $post->valor = Funcao::precoUSA($request->valor); 
                $post->data = $request->data; 
                $post->cliente_id = $request->cliente_id; 
                $post->pedido_status_id = 1;
                $post->ativo = 1;
                $post->save(); 
                
                if($request->hasFile('imagem') && $request->file('imagem')->isValid()){
                    $name_img = Funcao::envia_imagem_servidor($request->imagem);
                    $id = DB::table('pedidos')->select('id')->orderBy('id', 'DESC')->first();                    
                    $pedido_imagem = new Pedidos_Imagem;  
                    $pedido_imagem->pedido_id = $id->id;
                    $pedido_imagem->img = $name_img;
                    $pedido_imagem->capa = $name_img;
                    $pedido_imagem->save(); 
                }

            break; 
        }
        return redirect("/painel/".$pagina."/listar")->with('msg', 'Cadastrado com sucesso!');  
    }    

    public function painel_put(request $request, $pagina, $id){
        switch($pagina){  
            case "clientes": 
                $dados = $request->All();
                Clientes::findOrFail($request->id)->update($dados);
                return redirect("/painel/clientes/listar")->with('msg', 'Salvo com sucesso!'); 
            break;
            case "pedidos": 
                $dados = $request->All();
                unset($dados['imagem']);
                $dados['valor'] = Funcao::precoUSA($dados['valor']);
                Pedidos::findOrFail($id)->update($dados);
                if($request->hasFile('imagem') && $request->file('imagem')->isValid()){
                    $name_img = Funcao::envia_imagem_servidor($request->imagem); 
                    $id_pedidosDB = DB::table('pedidos_imagem')->select('id')->where('pedido_id', $id)->first();
                    if($id_pedidosDB == ""){ 
                        $pedido_imagem = new Pedidos_Imagem;  
                        $pedido_imagem->pedido_id = $id; 
                        $pedido_imagem->img = $name_img;
                        $pedido_imagem->capa = $name_img;
                        $pedido_imagem->save(); 
                    }else{
                        $dados_imagem['img'] = $name_img;
                        $dados_imagem['capa'] = $name_img;
                        Pedidos_Imagem::findOrFail($id_pedidosDB->id)->update($dados_imagem);  
                    }
                }
                return redirect("/painel/pedidos/listar")->with('msg', 'Salvo com sucesso!'); 
            break;
            case "excluir_clientes": 
                $dados['ativo'] = 0;
                Clientes::findOrFail($id)->update($dados);
                return redirect("/painel/clientes/listar"); 
            break;
            case "excluir_pedidos": 
                $dados['ativo'] = 0;
                Pedidos::findOrFail($id)->update($dados);
                return redirect("/painel/pedidos/listar"); 
            break; 
        }
    }

    public function painel_clientes($acao, $id = null){
        switch($acao){ 
            case "cadastrar": 
                $acao = "Cadastrar";
                $resultDB = []; 
            break;
            case "editar":
                $acao = "Editar";
                $resultDB = Clientes::findOrFail($id); 
            break;
            case "listar":
                $acao = "Listar";
                $resultDB = DB::table('clientes')->select('*')->where('ativo', '1')->orderBy('nome', 'ASC')->get(); 
            break;   
        }
        return view('painel.clientes', ['acao' => $acao, 'resultDB' => $resultDB]);
    }
    public function painel_pedidos($acao, $id = null){
        switch($acao){
            case "cadastrar":
                $acao = "Cadastrar";
                $resultDB = [];
                $result_clientes = DB::table('clientes')->select('*')->where('ativo', '1')->orderBy('nome', 'ASC')->get(); 
                $result_status = [];
                $result_img_pedidos = [];
            break; 
            case "editar":
                $acao = "Editar";
                $resultDB = Pedidos::findOrFail($id);
                $result_img_pedidos = DB::table('pedidos_imagem')->select('img')->where('pedido_id', $resultDB->id)->first();
                $result_clientes = DB::table('clientes')->select('*')->where('ativo', '1')->orderBy('nome', 'ASC')->get();  
                $result_status = DB::table('pedido_status')->select('*')->orderBy('descricao', 'ASC')->get(); 
            break;
            case "listar": 
                $acao = "Listar";
                $resultDB = DB::table('pedidos')->join('clientes', 'clientes.id', '=', 'pedidos.cliente_id')->join('pedido_status', 'pedido_status.id', '=', 'pedidos.pedido_status_id')->select('pedidos.*', 'clientes.nome', 'pedido_status.descricao')->where('pedidos.ativo', '1')->orderBy('pedidos.data', 'DESC')->get();
                $result_status = [];
                $result_clientes = [];
                $result_img_pedidos = [];
                foreach($resultDB as $result){
                    $result_img = DB::table('pedidos_imagem')->select('capa')->where('pedido_id', $result->id)->first();
                    if($result_img != ""){
                        $result_img_pedidos[] = $result_img->capa;
                    }else{
                        $result_img_pedidos[] = "";
                    }
                }
            break;
        }
        return view('painel.pedidos', ['acao' => $acao, 'resultDB' => $resultDB, 'result_clientes' => $result_clientes, 'result_status' => $result_status, 'result_img_pedidos' => $result_img_pedidos]);
    }

    public function ajax_csv (){
        $json['result'] = DB::table('pedidos')->join('clientes', 'clientes.id', '=', 'pedidos.cliente_id')->join('pedido_status', 'pedido_status.id', '=', 'pedidos.pedido_status_id')->select('pedidos.*', 'clientes.nome', 'pedido_status.descricao')->where('pedidos.ativo', '1')->orderBy('pedidos.data', 'DESC')->get();
        echo json_encode($json);  
        return;  
    }
}
