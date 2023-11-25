$(document).ready(function(){
    $(".valida-nome").keypress(function(e){
        let charCode = window.event.keyCode;
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode > 191 && charCode <= 255) || charCode == 32){
            
        }else{
            e.preventDefault();
        }
    });   

    $(".valida-cpf").mask("999.999.999-99");

    $(".valida-telefone").keyup(function(){
        let valor = $(this).val();
        valor = valor.replace(/\D/g,""); //Remove tudo o que não é dígito
        valor = valor.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
        valor = valor.replace(/(\d)(\d{4})$/,"$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
        $(this).val(valor);
    });  

    $(".excluir-js").on("click", async function(){
        $(".loading").show();
        if(confirm("Deseja excluir?")){
            let id = $(this).attr('id');
            $(".formulario-de-exclusao").attr('action', id);
            $(".formulario-de-exclusao button").click();  
        }else{
            $(".loading").hide();
        }
    });

    $(".valida-preco").on('keyup', function(){
        let preco = $(this).val();
        preco = preco.replace(/[^\d,]/g, '');
        preco = preco.toString().replace(/\D/g,"");
        preco = preco.toString().replace(/(\d)(\d{8})$/,"$1.$2");
        preco = preco.toString().replace(/(\d)(\d{5})$/,"$1.$2");
        preco = preco.toString().replace(/(\d)(\d{2})$/,"$1,$2");
        $(this).val(preco);
    });

    $('.preview-foto-js').on("change", function(){
        $(this).each(function(index){
            if ($(this).eq(index).val() != ""){
                readURL(this);
            }
        });

    });

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.preview-foto').html(`<img src="${e.target.result}">`);
            };
            reader.readAsDataURL(input.files[0]);
        }else {
            var img = input.value;
            $('.preview-foto').html(`<img src="${img}">`);
        }  
    }  
    
    function datetimeBR(datetime) {
        datetime = datetime.split(" ");
        let d = datetime[0];
        let h = datetime[1];
        d = d.split("-");
        h = h.split(":");
        d = `${d[2]}/${d[1]}/${d[0]}`;
        h = `${h[0]}:${h[1]}`;
        return `${h} - ${d}`;
    } 

    $('.gerar-csv').on("click", async function(){        
        await $.ajax({
            url: `/painel/ajax_csv`,  
            data: {"_token": "{{ csrf_token() }}"}, 
            type: 'get',
            dataType: 'json',
            success: function (data) {
                let linhas = ""; 
                for(let i of data.result){
                    //let valor = Intl.NumberFormat('pt-br', {style: 'currency', currency: 'BRL'}).format(i.valor);
                    linhas += `${datetimeBR(i.data)},${i.produto},${i.nome},${i.valor},${i.descricao}\n`;
                }
                let tabela = `Horário/Data,Produto,Cliente,Preço,Status\n${linhas}`;
                downloadCSVFile(tabela);
            }
        });       
    });
 
    function downloadCSVFile(csv_data) {
        // Create CSV file object and feed our csv_data into it
        CSVFile = new Blob(["\ufeff", csv_data], {type: "text/csv"});

        // Create to temporary link to initiate download process
        var temp_link = document.createElement('a');

        // Download csv file
        temp_link.download = "planilha-de-pedidos.csv";
        var url = window.URL.createObjectURL(CSVFile);
        temp_link.href = url;

        // This link should not be displayed
        temp_link.style.display = "none";
        document.body.appendChild(temp_link);

        // Automatically click the link to trigger download
        temp_link.click();
        document.body.removeChild(temp_link);
    }

    $('.menu-mobile-icon').click(function() {
        $('.menu-lateral-engloba').css({"left": "0%", "transition": "0.5s"});
    });
    $('.menu-lateral-fechar').click(function() {
        $('.menu-lateral-engloba').css({"left": "-100%", "transition": "0.5s"});
    });

});