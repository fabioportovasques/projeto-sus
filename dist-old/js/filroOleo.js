//Funções de inputs dinamicos Filtro de òleo


    
    /**
 * Esconde um elemento adicionando o atributo hidden nele.
 *
 * @param { Element } element
 * @returns { void }
 */
const hiddenElement = (element) => element.setAttribute('hidden', true);

/**
 * Mostra um elemento removendo o atributo hidden nele.
 *
 * @param { Element } element
 * @returns { void }
 */
const showElement = (element) => element.removeAttribute('hidden');

/**
 * Função que representa a execução principal do nosso código e serve apenas
 * para isolar o escopo.
 */
const app = () => {
    /**
     * O select que controla a visibilidade do select de escolher os filtros de
     * óleo.
     *
     * @type { HTMLSelectElement }
     */
    const hasOilFilterSelect = document.querySelector('#filtro_oleo');

    /**
     * O select de escolher os filtros de óleo.
     *
     * @type { HTMLSelectElement }
     */
    const oilFilterField = document.querySelector('#filtro_oleo-field');

    /**
     * Garante que só vai executar alguma coisa caso os elementos selecionados
     * existam. O que torna o nosso script seguro em tempo de execução.
     */
    if (hasOilFilterSelect && oilFilterField) {
        /**
         * Função que isola a lógica relacionada a trocar o estado do nosso
         * campo escondido, baseado no valor de um outro select que é recebido
         * como parâmetro.
         *
         * @param { HTMLSelectElement } toggler
         */
        const toggleOilFilterFieldVisibility = (toggler) => {
            /**
             * constante que representa se o valor selecionado é para ter
             * os filtros ou não.
             *
             * Obs: O value no option selecionado do select que for passado
             *      para essa função devem ser "true" para que seja
             *      identificado como verdadeiro e assim o campo de filtro
             *      apareça.
             *
             * @type { boolean }
             */
            const hasOilFilter = toggler.value === 'true';

            /**
             * A função que será executada dependendo do valor da constante
             * `hasOilFilter`
             *
             * @type { (element: Element) => void }
             */
            const action = hasOilFilter ? showElement : hiddenElement;
            action(oilFilterField);
        };

        /**
         * Atrela um evento em `hasOilFilterSelect` para que toda vez que um
         * valor seja selecionado, ele execute a função criada acima passando
         * o próprio `hasOilFilterSelect` como parâmetro.
         */
        hasOilFilterSelect.addEventListener('change', () => {
            toggleOilFilterFieldVisibility(hasOilFilterSelect);
        });

        /**
         * Chamamos a função de trocar a visibilidade do campo de filtro de
         * óleo uma vez fora do evento para garantir que o atributo hidden
         * será colocado via JS no campo, pois deixar ele lá no HTML faria com
         * que usuários com JS desabilitado não conseguissem ver esse campo, o
         * que incapacitária eles de finalizarem o formulário.
         */
        toggleOilFilterFieldVisibility(hasOilFilterSelect);
    }
};

/**
 * Garante que o código irá rodar depois de a página ter carregado.
 */
window.onload = app;

/*
*******************************************************************************
*/
//Funções de inputs dinamicos Filtro de combustivel

