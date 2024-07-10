{/* <script>
    // Função para abrir as telas secundárias com base no parâmetro recebido
    function abrirTela(tela) {
        // Carregar o conteúdo da tela correspondente
        var url;
        switch (tela) {
            case 'cadastroUsuario':
                url = 'cadastroUsuario.html'; // substitua com o caminho do seu arquivo HTML
                break;
            case 'listagemUsuario':
                url = 'listagemUsuario.html';
                break;
            case 'cadastroVeiculo':
                url = 'cadastroVeiculo.html';
                break;
            case 'listagemVeiculo':
                url = 'listagemVeiculo.html';
                break;
            case 'cadastroCliente':
                url = 'cadastroCliente.html';
                break;
            case 'listagemCliente':
                url = 'listagemCliente.html';
                break;
            case 'cadastroLocacao':
                url = 'cadastroLocacao.html';
                break;
            case 'listagemLocacao':
                url = 'listagemLocacao.html';
                break;
            case 'cadastroPagamento':
                url = 'cadastroPagamento.html';
                break;
            case 'listagemPagamento':
                url = 'listagemPagamento.html';
                break;
            default:
                url = '404.html'; // página de erro 404, se necessário
                break;
        }

        // Carregar a página na div telaSecundaria usando fetch API
        fetch(url)
            .then(response => response.text())
            .then(data => {
                document.getElementById('telaSecundaria').innerHTML = data;
            })
            .catch(error => console.error('Erro ao carregar a página:', error));
    }
</script> */}