@extends('layouts.main')
@section('title', 'Leme Forense')
@section('content')
<div class="container-home">
    <div>
        <span></span>
        @guest
            <a href="{{ asset('/login') }}">Fazer login</a> 
        @endguest
        @auth
            <a href="{{ asset('/painel') }}">Voltar ao painel</a>
        @endauth
    </div>
</div>
@endsection