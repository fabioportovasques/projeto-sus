
$(function(){
    
    $('#form-cons-veiculo').on('submit', function(e){
        e.preventDefault(); //Impedir a ação de enviar o formulário

        var cpf_cliente = $('input[name=cpf_cliente').val();
      

        //fazer a requisição ajax

        $.ajax({
            type:'POST',
            url:'cliente.class.php',
            data:{email:email, senha:senha},
            success: function(msg){
                alert(msg);
            }


        });
    });

});