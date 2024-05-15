export default class ListagemUsuariosPage {
  inputPesquisa = 'input[placeholder="E-mail ou nome"]';

  headerUsuarioNaoEncontrado = 'div.sc-koXPp.csBRDe h3';
  linkPaginaCadastroUsuario = 'a[href="/users/novo"]';

  pesquisar(textoPesquisa) {
    cy.get(this.inputPesquisa).type(textoPesquisa);
  }
}
