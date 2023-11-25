<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>@yield('title')</title>
        <link rel="stylesheet" href="{{ asset('css/main.css') }}">
        <meta name="theme-color" content="#22425c">
        <link rel="icon" href="{{ asset('img/favicon-32x32.png') }}">
    </head>
    <body>
        <header>
            @if(Request::segment(1) == 'painel')
                <div class="menu-mobile">
                    <a class="menu-mobile-logo"></a>
                    <a class="menu-mobile-icon"></a>
                </div>
                <div class="menu-lateral-engloba">
                    <div class="menu-lateral">
                        <div class="menu-lateral-logo"></div>
                        <div class="menu-lateral-links"> 
                            <a href="{{ asset('painel') }}" class="{{ (Request::segment(1) == 'painel' && Request::segment(2) == '' ? 'menu-lateral-ativo' : '') }}">
                                <ion-icon name="home-outline"></ion-icon>
                                <p>Home</p>  
                            </a>
                            <a href="{{ asset('painel/clientes/cadastrar') }}" class="{{ (Request::segment(2) == 'clientes' && (Request::segment(3) == 'cadastrar' || Request::segment(3) == 'editar')  ? 'menu-lateral-ativo' : '') }}">
                                <ion-icon name="people-outline"></ion-icon>
                                <p>Clientes</p>
                            </a>
                            <a href="{{ asset('painel/clientes/listar') }}" class="{{ (Request::segment(2) == 'clientes' && Request::segment(3) == 'listar'  ? 'menu-lateral-ativo' : '') }}">
                                <ion-icon name="people-outline"></ion-icon>
                                <p>Listar Clientes</p>
                            </a>
                            <a href="{{ asset('painel/pedidos/cadastrar') }}" class="{{ (Request::segment(2) == 'pedidos' && (Request::segment(3) == 'cadastrar' || Request::segment(3) == 'editar')  ? 'menu-lateral-ativo' : '') }}">
                                <ion-icon name="cart-outline"></ion-icon>
                                <p>Pedidos</p>
                            </a>
                            <a href="{{ asset('painel/pedidos/listar') }}" class="{{ (Request::segment(2) == 'pedidos' && Request::segment(3) == 'listar'  ? 'menu-lateral-ativo' : '') }}">
                                <ion-icon name="cart-outline"></ion-icon>
                                <p>Listar Pedidos</p>
                            </a>
                        </div>
                        <div class="menu-lateral-fundo"> 
                            <form class="form-fake2" action="{{ asset('logout') }}" method="POST">
                                @csrf
                                <button>
                                    <a>
                                        <ion-icon name="log-out-outline"></ion-icon>
                                        <p>Logout</p>
                                    </a>
                                </button>
                            </form> 
                        </div>
                    </div>
                    <div class="menu-lateral-fechar"></div>
                </div>
            @endif
        </header>
        <main>
            <div class="loading"><div class="engloba-loading"><div class="square-center"><div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div></div></div>
            @yield('content')
        </main>
        <footer>

        </footer>
        @if(Request::segment(1) == 'painel')
            <form class="formulario-de-exclusao" action="" method="POST">
                @csrf
                @method('PUT')
                <button></button>
            </form> 
        @endif
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
        <script src="{{ asset('js/funcoes.js') }}"></script>
        @if(session('msg'))
            <script>
                alert("{{ session('msg') }}");
            </script>
        @endif
    </body> 
</html> 
