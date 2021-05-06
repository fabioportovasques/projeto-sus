
            

            function validar(cpf_cnpj) {
                // Valida
                var valida = valida_cpf_cnpj(cpf_cnpj);

                // Testa a validação
                if (valida) {
                    alert('CPF/CNPJ OK');
                } else {
                     document.getElementById("cpf_cnpj").focus();


                }


            }




            /*
             verifica_cpf_cnpj
             
             Verifica se é CPF ou CNPJ
             
             */
            function verifica_cpf_cnpj(valor) {

                // Garante que o valor Ã© uma string
                valor = valor.toString();

                // Remove caracteres invá¡lidos do valor
                valor = valor.replace(/[^0-9]/g, '');

                // Verifica CPF
                if (valor.length === 11) {
                    return 'CPF' ;
                }

                // Verifica CNPJ
                else if (valor.length === 14) {
                    return 'CNPJ';
                }

                // Não retorna nada
                else {
                    return  ;
                }

            } // verifica_cpf_cnpj

            /*
             calc_digitos_posicoes
             
             Multiplica dí­gitos vezes posições
             
             @param string digitos Os digitos desejados
             @param string posicoes A posição que vai iniciar a regressão
             @param string soma_digitos A soma das multiplicações entre posições e dígitos

 

             @return string Os dí­gitos enviados concatenados com o Algorítimo 
             */
            function calc_digitos_posicoes(digitos, posicoes = 10, soma_digitos = 0) {

                // Garante que o valor são uma string
                digitos = digitos.toString();

                // Faz a soma dos dí­gitos com a posição
                // Ex. para 10 posições:
                //   0    2    5    4    6    2    8    8   4
                // x10   x9   x8   x7   x6   x5   x4   x3  x2
                //   0 + 18 + 40 + 28 + 36 + 10 + 32 + 24 + 8 = 196
                for (var i = 0; i < digitos.length; i++) {z
                    // Preenche a soma com o dígito vezes a posição
                    soma_digitos = soma_digitos + (digitos[i] * posicoes);

                    // Subtrai 1 da posição
                    posicoes--;

                    // Parte  para CNPJ
                    // Ex.: 5-4-3-2-9-8-7-6-5-4-3-2
                    if (posicoes < 2) {
                        // Retorno a posiÃ§Ã£o para 9
                        posicoes = 9;
                    }
                }

                // Captura o resto da divisão entre soma_digitos dividido por 11
                // Ex.: 196 % 11 = 9
                soma_digitos = soma_digitos % 11;

                // Verifica se soma_digitos são menor que 2
                if (soma_digitos < 2) {
                    // soma_digitos agora serÃ¡ zero
                    soma_digitos = 0;
                } else {
                    // Se for maior que 2, o resultado Ã© 11 menos soma_digitos
                    // Ex.: 11 - 9 = 2
                    // Nosso dÃ­gito procurado Ã© 2
                    soma_digitos = 11 - soma_digitos;
                }

                // Concatena mais um dÃ­gito aos primeiro nove dÃ­gitos
                // Ex.: 025462884 + 2 = 0254628842
                var cpf = digitos + soma_digitos;

                // Retorna
                return cpf;

            } // calc_digitos_posicoes

            /*
             Valida CPF
             
             Valida se for CPF
             
             @param  string cpf O CPF com ou sem pontos e traÃ§o
             @return bool True para CPF correto - False para CPF incorreto
             */
            function valida_cpf(valor) {

                // Garante que o valor Ã© uma string
                valor = valor.toString();

                // Remove caracteres invÃ¡lidos do valor
                valor = valor.replace(/[^0-9]/g, '');


                // Captura os 9 primeiros dÃ­gitos do CPF
                // Ex.: 02546288423 = 025462884
                var digitos = valor.substr(0, 9);

                // Faz o cÃ¡lculo dos 9 primeiros dÃ­gitos do CPF para obter o primeiro dÃ­gito
                var novo_cpf = calc_digitos_posicoes(digitos);

                // Faz o cÃ¡lculo dos 10 dÃ­gitos do CPF para obter o Ãºltimo dÃ­gito
                var novo_cpf = calc_digitos_posicoes(novo_cpf, 11);

 


                // Verifica se o novo CPF gerado Ã© idÃªntico ao CPF enviado
                if (novo_cpf === valor) {
                    // CPF vÃ¡lido
                    return true;
                } else {
                    // CPF invÃ¡lido
                    return false ;



                }


            } 
            
            // valida_cpf

            /*
             valida_cnpj
             
             Valida se for um CNPJ
             
             @param string cnpj
             @return bool true para CNPJ correto
             */
            function valida_cnpj(valor) {

                // Garante que o valor Ã© uma string
                valor = valor.toString();

                // Remove caracteres invÃ¡lidos do valor
                valor = valor.replace(/[^0-9]/g, '');


                // O valor original
                var cnpj_original = valor;

                // Captura os primeiros 12 nÃºmeros do CNPJ
                var primeiros_numeros_cnpj = valor.substr(0, 12);

                // Faz o primeiro cÃ¡lculo
                var primeiro_calculo = calc_digitos_posicoes(primeiros_numeros_cnpj, 5);

                // O segundo cÃ¡lculo Ã© a mesma coisa do primeiro, porÃ©m, comeÃ§a na posiÃ§Ã£o 6

 

                var segundo_calculo = calc_digitos_posicoes(primeiro_calculo, 6);

                // Concatena o segundo dÃ­gito ao CNPJ
                var cnpj = segundo_calculo;

                // Verifica se o CNPJ gerado Ã© idÃªntico ao enviado
                if (cnpj === cnpj_original) {
                    return true;
                }

                // Retorna falso por padrÃ£o
                return false;

            } // valida_cnpj

            /*
             valida_cpf_cnpj
             
             Valida o CPF ou CNPJ
             
             @access public
             @return bool true para vÃ¡lido, false para invÃ¡lido
             */
            function valida_cpf_cnpj(valor) {

                // Verifica se Ã© CPF ou CNPJ
                var valida = verifica_cpf_cnpj(valor);

                // Garante que o valor Ã© uma string
                valor = valor.toString();

                // Remove caracteres invÃ¡lidos do valor
                valor = valor.replace(/[^0-9]/g, '');


                // Valida CPF
                if (valida === 'CPF') {
                    // Retorna true para cpf vÃ¡lido
                    return valida_cpf(valor);
                }

                // Valida CNPJ
                else if (valida === 'CNPJ') {
                    // Retorna true para CNPJ vÃ¡lido
                    return valida_cnpj(valor);

                }

                // NÃ£o retorna nada
                else {
                    return false;

                }

            } // valida_cpf_cnpj

            /*
             formata_cpf_cnpj
             
             Formata um CPF ou CNPJ
             
             @access public
             @return string CPF ou CNPJ formatado
             */
            function formata_cpf_cnpj(valor) {

                // O valor formatado
                var formatado = false;

                // Verifica se Ã© CPF ou CNPJ
                var valida = verifica_cpf_cnpj(valor);

                // Garante que o valor Ã© uma string
                valor = valor.toString();

                // Remove caracteres invÃ¡lidos do valor
                valor = valor.replace(/[^0-9]/g, '');


                // Valida CPF
                if (valida === 'CPF') {

                    // Verifica se o CPF Ã© vÃ¡lido
                    if (valida_cpf(valor)) {

                        // Formata o CPF ###.###.###-##
                        formatado = valor.substr(0, 3) + '.';
                        formatado += valor.substr(3, 3) + '.';
                        formatado += valor.substr(6, 3) + '-';
                        formatado += valor.substr(9, 2) + '';

                    }

                }

                // Valida CNPJ
                else if (valida === 'CNPJ') {

                    // Verifica se o CNPJ Ã© vÃ¡lido
                    if (valida_cnpj(valor)) {

                        // Formata o CNPJ ##.###.###/####-##
                        formatado = valor.substr(0, 2) + '.';
                        formatado += valor.substr(2, 3) + '.';
                        formatado += valor.substr(5, 3) + '/';
                        formatado += valor.substr(8, 4) + '-';
                        formatado += valor.substr(12, 14) + '';

                    }

                }

                // Retorna o valor 
                return formatado;
                
            } // formata_cpf_cnpj
           