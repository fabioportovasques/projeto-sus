
$(function(){
    
    $('#form-cons-veiculo').on('submit', function(e){
        e.preventDefault(); //Impedir a ação de enviar o formulário

        var cpf_medico = $('input[name=cpf_medico').val();
      

        //fazer a requisição ajax

        $.ajax({
            type:'POST',
            url:'medico.class.php',
            data:{email:email, senha:senha},
            success: function(msg){
                alert(msg);
            }


        });
    });

});