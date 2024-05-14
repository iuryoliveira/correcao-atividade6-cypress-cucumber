# language: pt

Funcionalidade: Criar usuário
  Como uma pessoa qualquer
  Desejo registrar informações de usuário
  Para poder manipular estas informações livremente

Contexto: Deve ter acessado a funcionalidade de cadastro
  Dado que acessei a página de criação de usuário

Cenário: Criação de novo usuário informando os dados cadastrais
  Quando informar um novo nome válido
  E informar um novo e-mail válido
  E confirmar a operação
  Então o usuário será cadastrado com sucesso

Esquema do Cenário: Não deve ser possível cadastrar usuários com e-mails inválidos
  Quando informar um novo nome válido
  E informar o email "<email>"
  E confirmar a operação
  Então irei visualizar o erro de formulário "<mensagem>"
  Exemplos:
  | email          | mensagem                                       |
  | meuemail       | Formato de e-mail inválido                     |
  | meuemail@teste | Formato de e-mail inválido                     |
  | @teste         | Formato de e-mail inválido                     |
  | @              | Informe pelo menos 4 caracteres para o e-mail. |
  | @.com          | Formato de e-mail inválido                     |
  | .com           | Formato de e-mail inválido                     |

Cenário: Não deve ser possível cadastrar um e-mail já em uso
  Quando informar um novo nome válido
  E informar um email que já está cadastrado
  E confirmar a operação
  Então irei visualizar a mensagem de erro "Este e-mail já é utilizado por outro usuário."

Esquema do Cenário: Não deve ser possível cadastrar usuário com nome com quantidade inválida de caracteres
  Quando informar o nome inválido "<nome>"
  Então irei visualizar o erro de formulário "<mensagem>"
  Exemplos:
  | nome                                                                                                   | mensagem                                     |
  | AsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAasdasdadsadasdadsadsasdfghjklo  | Informe no máximo 100 caracteres para o nome |
  | AsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAsdadsaAasdasdadsadasdadsadsasdfghjklos | Informe no máximo 100 caracteres para o nome |
  | Gus                                                                                                    | Informe pelo menos 4 letras para o nome.     |