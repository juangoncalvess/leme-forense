@extends('layouts.main')
@section('title', 'Leme Forense | Pedidos')
@section('content')
<div class="container-principal">
    <p class="container-principal-titulo">Painel > Pedidos > {{ $acao }}</p>
    <div class="container-principal-div">
        @if($acao != "Listar")
            <form class="container-painel-div-form" action="{{ $acao == 'Editar' ? asset('painel/put/pedidos/'.$resultDB->id) : asset('painel/post/pedidos') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @if($acao == "Editar")  
                    @method('PUT')
                @endif
                <div class="wid-20pc wid-100pc-mobile">
                    <p>Foto: </p> 
                    <label class="container-preview-foto">
                        <span class="preview-foto">
                            @if($acao == "Editar")
                                <img src="{{ $result_img_pedidos == '' ? asset('img/pedidos/sem-imagem.png') : asset('img/pedidos/original/'.$result_img_pedidos->img) }}">
                            @else 
                                <img src="{{ asset('img/pedidos/sem-imagem.png') }}">
                            @endif 
                        </span> 
                        <strong>Selecione a imagem</strong>
                        <input class="preview-foto-js" type="file" name="imagem">
                    </label>
                </div>
                <div class="wid-78pc mg0 display-flex-between wid-100pc-mobile">
                    <div class="wid-100pc">
                        <p>Produto: <b>*</b></p>  
                        <input type="text" name="produto" value="{{ $acao == 'Editar' ? $resultDB->produto : '' }}" required>
                    </div>
                    <div class="wid-100pc">
                        <p>Cliente: <b>*</b></p>
                        <select name="cliente_id" required>
                            <option value="" hidden>Selecione</option>
                            @foreach($result_clientes as $cliente)
                                @if($acao == "Editar") 
                                    <option value="{{ $cliente->id }}" {{ $resultDB->cliente_id == $cliente->id ? 'selected' : '' }} >{{ $cliente->nome }}</option>  
                                @else
                                    <option value="{{ $cliente->id }}">{{ $cliente->nome }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="wid-30pc wid-100pc-mobile">
                        <p>Valor: <b>*</b></p>
                        <input type="text" name="valor" class="valida-preco" value="{{ $acao == 'Editar' ? number_format($resultDB->valor, 2, ',' , '.') : '' }}" required>
                    </div>
                    <div class="wid-30pc wid-100pc-mobile">
                        <p>Data: <b>*</b></p> 
                        <input type="datetime-local" name="data" value="{{ $acao == 'Editar' ? $resultDB->data : '' }}" required>
                    </div> 
                    <div class="wid-36pc wid-100pc-mobile">
                        @if($acao == "Editar") 
                            <p>Status: <b>*</b></p>
                            <select name="pedido_status_id" required>
                                <option value="" hidden>Selecione</option>
                                @foreach($result_status as $status)
                                    <option value="{{ $status->id }}" {{ $resultDB->pedido_status_id == $status->id ? 'selected' : '' }} >{{ $status->descricao }}</option>  
                                @endforeach 
                            </select>
                        @endif
                    </div>
                    <div class="wid-100pc">
                        @if($acao == "Cadastrar")
                            <button class="button-acao-{{ $acao }} wid-100pc-mobile">Cadastrar</button>
                        @else
                            <button class="button-acao-{{ $acao }} wid-100pc-mobile">Salvar</button>
                        @endif
                    </div>
                </div>
            </form>
        @else
            <table class="container-principal-div-table" id="planilha">
                <thead>
                    <tr>
                        <td>Horário</td>
                        <td class="text-center wid-img display-none-mobile">Imagem</td>
                        <td>Produto</td>
                        <td>Cliente</td>
                        <td class="text-center wid-preco display-none-mobile">Preço</td>
                        <td class="text-center wid-status display-none-mobile">Status</td>
                        <td class="text-center wid-acao">Ação</td>
                    </tr>
                </thead>
                <tbody>
                    @foreach($resultDB as $result)
                        <tr>
                            <td>{{ Funcao::datetimeBR($result->data) }}</td>
                            <td class="text-center wid-img display-none-mobile">
                                <img class="img-capa" src="{{ $result_img_pedidos[$loop->index] == '' ? asset('img/pedidos/sem-imagem.png') : asset('img/pedidos/capa/'.$result_img_pedidos[$loop->index]) }}" alt="{{ $result->produto }}">
                            </td> 
                            <td>{{ $result->produto }}</td> 
                            <td>{{ $result->nome }}</td>
                            <td class="text-center wid-preco display-none-mobile">R$ {{ number_format($result->valor , 2, "," , "."); }}</td>
                            <td class="text-center wid-status display-none-mobile"><a class="status-pedido status-pedido-{{ $result->pedido_status_id }}">{{ $result->descricao }}</a></td>
                            <td class="text-center wid-acao">
                                <div class="botoes-de-acao">
                                    <a href="{{ asset('painel/pedidos/editar/'.$result->id) }}" class="editar">Editar</a>                                     
                                    <a class="excluir excluir-js display-none-mobile" id="{{ asset('painel/put/excluir_pedidos/'.$result->id) }}">Excluir</a>
                                </div>
                            </td> 
                        </tr>
                    @endforeach
                </tbody>
            </table>
            @if(count($resultDB) > 0) 
                <a class="gerar-csv display-none-mobile">Gerar arquivo CSV</a>
            @endif
        @endif
    </div> 
</div>
@endsection