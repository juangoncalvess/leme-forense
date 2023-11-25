@extends('layouts.main')
@section('title', 'Leme Forense | Clientes')
@section('content')
<div class="container-principal">
    <p class="container-principal-titulo">Painel > Clientes > {{ $acao }}</p>
    <div class="container-principal-div">
        @if($acao != "Listar")
            <form class="container-painel-div-form" action="{{ $acao == 'Editar' ? asset('painel/put/clientes/'.$resultDB->id) : asset('painel/post/clientes') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @if($acao == "Editar") 
                    @method('PUT')
                @endif
                <div class="wid-68pc wid-100pc-mobile">
                    <p>Nome: <b>*</b></p>  
                    <input type="text" name="nome" class="valida-nome" value="{{ $acao == 'Editar' ? $resultDB->nome : '' }}" required>
                </div>
                <div class="wid-30pc wid-100pc-mobile">
                    <p>CPF: <b>*</b></p>
                    <input type="text" name="cpf" class="valida-cpf" value="{{ $acao == 'Editar' ? $resultDB->cpf : '' }}" required>
                </div>
                <div class="wid-100pc mg0">
                    <div class="wid-30pc wid-100pc-mobile">
                        <p>Data de nascimento: <b>*</b></p>
                        <input type="date" max="{{ Funcao::data_atual() }}" name="data_nascimento" value="{{ $acao == 'Editar' ? $resultDB->data_nascimento : '' }}" required>
                    </div>
                </div>
                <div class="wid-100pc mg0">
                    <div class="wid-30pc wid-100pc-mobile">
                        <p>Telefone:</p>
                        <input type="text" name="telefone" class="valida-telefone" maxlength="15" value="{{ $acao == 'Editar' ? $resultDB->telefone : '' }}">
                    </div>
                </div>
                <div class="wid-100pc">
                    @if($acao == "Cadastrar")
                        <button class="button-acao-{{ $acao }} wid-100pc-mobile">Cadastrar</button>
                    @else
                        <button class="button-acao-{{ $acao }} wid-100pc-mobile">Salvar</button>
                    @endif
                </div>
            </form> 
        @else
            <table class="container-principal-div-table">
                <thead>
                    <tr>
                        <td>Nome</td>
                        <td class="text-center wid-cpf display-none-mobile">CPF</td>
                        <td class="text-center wid-nascimento display-none-mobile">Data nasc.</td>
                        <td class="text-center wid-telefone display-none-mobile">Telefone</td>
                        <td class="text-center wid-acao">Ação</td>
                    </tr>
                </thead> 
                <tbody>
                    @foreach($resultDB as $result)
                        <tr>
                            <td>{{ $result->nome }}</td>
                            <td class="text-center wid-cpf display-none-mobile">{{ $result->cpf }}</td>
                            <td class="text-center wid-nascimento display-none-mobile">{{ Funcao::dateBR($result->data_nascimento) }}</td>
                            <td class="text-center wid-telefone display-none-mobile">{{ $result->telefone == "" ? "---" : $result->telefone }}</td>
                            <td class="text-center wid-acao">
                                <div class="botoes-de-acao">
                                    <a href="{{ asset('painel/clientes/editar/'.$result->id) }}" class="editar">Editar</a>                                     
                                    <a class="excluir excluir-js display-none-mobile" id="{{ asset('painel/put/excluir_clientes/'.$result->id) }}">Excluir</a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>
</div>
@endsection