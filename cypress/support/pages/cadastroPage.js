export default class CadastroPage {
  inputNome = '#name';
  inputEmail = '#email';
  buttonSalvar = 'button[type="submit"]';

  toastSucesso = 'div[role="status"]';

  spanErro = 'span.sc-cPiKLX.feFrSQ';

  modalErro = 'div.sc-dCFHLb.lmTxRO';
  buttonCancelar = 'button.sc-lcIPJg.ifkIA-D';

  typeNome(nome) {
    cy.get(this.inputNome).type(nome);
  }

  typeEmail(email) {
    cy.get(this.inputEmail).type(email);
  }

  clickButtonSalvar() {
    cy.get(this.buttonSalvar).click();
  }

  clickFecharModal() {
    cy.get(this.buttonCancelar).click();
  }
}
