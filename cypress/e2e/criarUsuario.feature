# language: pt

Funcionalidade: Criar usuário
  Como uma pessoa qualquer
  Desejo registrar informações de usuário
  Para poder manipular estas informações livremente

Contexto: Deve ter acessado a funcionalidade de cadastro
  Dado que acessei a página de criação de usuário

@ignore
Cenário: Criação de novo usuário informando os dados cadastrais
  Quando informar um novo nome válido
  E informar um novo e-mail válido
  E confirmar a operação
  Então o usuário será cadastrado com sucesso

@ignore
Esquema do Cenário: Não deve ser possível cadastrar usuários com e-mails inválidos
  Quando informar um novo nome válido
  E informar o email "<email>"
  E confirmar a operação
  Então irei visualizar o erro de formulário "<mensagem>"
  Exemplos:
  | email                                                            | mensagem                                        |
  | meuemail                                                         | Formato de e-mail inválido                      |
  | meuemail@teste                                                   | Formato de e-mail inválido                      |
  | @teste                                                           | Formato de e-mail inválido                      |
  | @                                                                | Informe pelo menos 4 caracteres para o e-mail.  |
  | @.com                                                            | Formato de e-mail inválido                      |
  | .com                                                             | Formato de e-mail inválido                      |
  | iury@teste.commmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm    | Informe no máximo 60 caracteres para o e-mail   |
  | iury@teste.commmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm   | Informe no máximo 60 caracteres para o e-mail   |

Cenário: Não deve ser possível cadastrar um e-mail já em uso
  Quando informar um novo nome válido
  E informar um email que já está cadastrado
  E confirmar a operação
  Então irei visualizar a mensagem de erro "Este e-mail já é utilizado por outro usuário."

@ignore
Esquema do Cenário: Não deve ser possível cadastrar usuário com nome com quantidade inválida de caracteres
  Quando informar o nome inválido "<nome>"
  Então irei visualizar o erro de formulário "<mensagem>"
  Exemplos:
  | nome                                                                                                   | mensagem                                     |
  | AsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAasdasdadsadasdadsadsasdfghjklo  | Informe no máximo 100 caracteres para o nome |
  | AsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAasdasdadsadasdadsadsasdfghjklos | Informe no máximo 100 caracteres para o nome |
  | Gus                                                                                                    | Informe pelo menos 4 letras para o nome.     |

@ignore
Esquema do Cenário: Deve ser possível cadastrar usuário com nome entre 4 e 100 caracteres
  Quando informar o nome "<nome>"
  E informar um novo e-mail válido
  E confirmar a operação
  Então o usuário será cadastrado com sucesso
  Exemplos:
  | nome  |
  | Anna  |
  | Maria |
  | AsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAasdasdadsadasdadsadsasdfghjk |
  | AsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAasdasdadsadasdadsadsasdfghjkl |

Cenário: Não deve ser possível informar um nome em branco
  Quando informar o nome "    "
  E informar um novo e-mail válido
  E confirmar a operação
  Então irei visualizar a mensagem de erro "Não foi possível cadastrar o usuário!"