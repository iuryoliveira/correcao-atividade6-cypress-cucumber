import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';
import CadastroPage from '../pages/cadastroPage';
import { fakerPT_BR } from '@faker-js/faker';
const paginaCadastro = new CadastroPage();

Given('que acessei a página de criação de usuário', function () {
  cy.visit('/users/novo');
});

When('informar um novo nome válido', function () {
  const nome = fakerPT_BR.person.fullName();
  paginaCadastro.typeNome(nome);
});

When('informar um novo e-mail válido', function () {
  const email = fakerPT_BR.internet.email();
  paginaCadastro.typeEmail(email);
});

When('confirmar a operação', function () {
  cy.intercept(
    'POST',
    'https://rarocrud-80bf38b38f1f.herokuapp.com/api/v1/users'
  ).as('postUser');
  paginaCadastro.clickButtonSalvar();
});

When('informar o email {string}', function (email) {
  paginaCadastro.typeEmail(email);
});

When('informar um email que já está cadastrado', function () {
  cy.intercept(
    'POST',
    'https://rarocrud-80bf38b38f1f.herokuapp.com/api/v1/users',
    {
      statusCode: 422,
      body: {
        error: 'User already exists.',
      },
    }
  ).as('postUserError');
  paginaCadastro.typeEmail(fakerPT_BR.internet.email());
});

Then('o usuário será cadastrado com sucesso', function () {
  cy.wait('@postUser');
  cy.get(paginaCadastro.toastSucesso).contains('Usuário salvo com sucesso!');
});

Then('irei visualizar o erro de formulário {string}', function (mensagem) {
  cy.get(paginaCadastro.spanErro).contains(mensagem);
});

Then('irei visualizar a mensagem de erro {string}', function (mensagem) {
  cy.wait('@postUserError');
  cy.get(paginaCadastro.modalErro).contains(mensagem);
  cy.get(paginaCadastro.buttonCancelar).should('be.visible');
});

When('informar o nome inválido {string}', function (nome) {
  //concatenando string
  paginaCadastro.typeNome(nome + '{enter}');

  // interpolação de string
  // paginaCadastro.typeNome(`${nome} {enter}`);
});
