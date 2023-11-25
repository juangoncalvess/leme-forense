<?php
    namespace App\Helpers;
    use Image;

    class Funcao{
        public static function dateBR(string $data) {
            $data = explode("-", $data);
            $data = $data[2] . "/" . $data[1] . "/" . $data[0];
            return $data;
        }

        public static function datetimeBR(string $data) {
            $data = explode(" ", $data);
            $data_dia = explode("-", $data[0]); 
            $data_horario = explode(":", $data[1]);
            $data = $data_horario[0] . ":" . $data_horario[1] . " - " . $data_dia[2] . "/" . $data_dia[1] . "/" . $data_dia[0];
            return $data;
        }

        public static function data_atual() {
            date_default_timezone_set('America/Sao_Paulo');
            return date('Y-m-d');
        }

        public static function precoUSA(string $v) {
            $v = str_replace(".","", $v);
            $v = str_replace(",",".", $v);
            return $v;
        }

        public static function envia_imagem_servidor($img) { 
            $ext = $img->extension();
            $name_img = md5($img->getClientOriginalName() . strtotime("now")) . "." . $ext;
            $img->move(public_path('img/pedidos/original'), $name_img);
            $img_capa = Image::make(public_path('img/pedidos/original/'.$name_img))->fit(90, 100);  
            $img_capa->save(public_path('img/pedidos/capa/'.$name_img)); 
            return $name_img;
        }
    }