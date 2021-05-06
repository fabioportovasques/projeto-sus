
		$(document).ready(() => {

				//Adicionando inputs Filtro de óleo

				$('#btn1').click(() => {	
				$('#nome').innerHtml+=('<input type="text" id="nome" name="">')	
				
				})

				//Removendo inputs Filtro de óleo
				$('#btn2').mouseup(() => {	
				$('#nome').remove()
				
				})

				

				//Adicionando input Filtro de combustive

				$('#filtro_comb_add').mousedown(() => {	
				$('#filtro_comb').after('<input type="text" id="filtro_comb" name="">')	
				
				})

				//Removendo input Filtro de combustive

				$('#filtro_comb_remove').mousedown(() => {	
				$('#filtro_comb').remove()
				
				})

				//Adicionando input Filtro de ar

				$('#add_filtro_ar').mousedown(() => {	
				$('#filtro_ar').after('<input type="text" id="filtro_ar" name="">')	
				
				})

				//Removendo input Filtro de ar

				$('#remove_filtro_ar').mousedown(() => {	
				$('#filtro_ar').remove()
				
				})

				//Adicionando input Filtro de Cabine
				/*('#add_filtro_cabine')->referencia o nome
				do botão do form
				$('#filtro_cabine').after('<input type="text" id="filtro_cabine" name="">')	
				referencia o nome do input do form
				*/


				$('#add_filtro_cabine').mousedown(() => {	
				$('#filtro_cabine').after('<input type="text" id="filtro_cabine" name="">')	
				
				})

				//Removendo input Filtro de Cabine

				$('#remove_filtro_cabine').mousedown(() => {	
				$('#filtro_cabine').remove()
				
				})

		
		});
		
