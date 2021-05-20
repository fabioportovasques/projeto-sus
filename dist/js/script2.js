$(document).ready(() => {
	
	$('#medico').on('click', () => {
		//console.log('docu. clicado')
		//$('#pagina').load('cad-medico.php')
		//metodo get
		//$.get('documentacao.html', data => {
			//console.log(data)

			//metodo post
			$.post('cad-medico.php', data => {	
				$('#pagina').html(data)

		})		
		
	})

})	