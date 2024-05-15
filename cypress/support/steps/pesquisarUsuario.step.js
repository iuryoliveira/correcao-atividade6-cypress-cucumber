import {
  Given,
  When,
  Then,
  Before,
} from '@badeball/cypress-cucumber-preprocessor';
import ListagemUsuariosPage from '../pages/listagemUsuariosPage';
const paginaListagemUsuarios = new ListagemUsuariosPage();

Before({ tags: '@pesquisaEmBranco' }, function () {
  cy.intercept(
    'GET',
    'https://rarocrud-80bf38b38f1f.herokuapp.com/api/v1/search*',
    {
      statusCode: 200,
      body: [],
    }
  ).as('getSearch');
});

Before(
  {
    tags: '@cadastrarUsuarios',
  },
  function () {
    cy.request({
      method: 'POST',
      url: 'https://rarocrud-80bf38b38f1f.herokuapp.com/api/v1/users',
      body: {
        name: 'josefina',
        email: 'josefina@teste.com',
      },
      failOnStatusCode: false,
    });
    cy.request({
      method: 'POST',
      url: 'https://rarocrud-80bf38b38f1f.herokuapp.com/api/v1/users',
      body: {
        name: 'ana',
        email: 'teste@teste.com',
      },
      failOnStatusCode: false,
    });
  }
);

Given('que acessei a funcionalidade de listagem de usuários', function () {
  cy.intercept(
    'GET',
    'https://rarocrud-80bf38b38f1f.herokuapp.com/api/v1/users'
  ).as('getUsers');
  cy.visit('/users');
  cy.wait('@getUsers');
});

When('pesquisar um usuário pelo texto {string}', function (pesquisa) {
  cy.intercept(
    'GET',
    'https://rarocrud-80bf38b38f1f.herokuapp.com/api/v1/search*'
  ).as('getSearch');
  paginaListagemUsuarios.pesquisar(pesquisa);
});

Then(
  'irei visualizar os dados do usuário encontrado',
  function (tabelaDadosUsuarios) {
    cy.wait('@getSearch');
    const dadosUsuario = tabelaDadosUsuarios.rowsHash();
    cy.contains(dadosUsuario.nome);
    cy.contains(dadosUsuario.email);
  }
);

Then('irei visualizar a opção para cadastrar um novo usuário', function () {
  cy.wait('@getSearch');
  cy.get(paginaListagemUsuarios.headerUsuarioNaoEncontrado)
    .contains('Ops! Não existe nenhum usuário para ser exibido.')
    .and('be.visible');
  cy.get(paginaListagemUsuarios.linkPaginaCadastroUsuario)
    .contains('Cadastre um novo usuário')
    .and('be.visible');
});
