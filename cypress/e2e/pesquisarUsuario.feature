# language: pt
Funcionalidade: Pesquisar usuário
  Como uma pessoa qualquer
  Desejo pesquisar usuário por nome ou e-mail
  Para ser capaz de encontrar um usuário cadastrado facilmente

Contexto: Deve ter acessado a funcionalidade de listagem de usuários
  Dado que acessei a funcionalidade de listagem de usuários

@cadastrarUsuarios
Esquema do Cenário: Deve ser possível pesquisar um usuário através do nome ou do e-mail
  Quando pesquisar um usuário pelo texto "<pesquisa>"
  Então irei visualizar os dados do usuário encontrado
  | nome  | <nomeUsuario>  |
  | email | <emailUsuario> |
  Exemplos:
  | pesquisa    | nomeUsuario | emailUsuario        |
  | josefina    | josefina    | josefina@teste.com  |
  | teste@teste | ana         | teste@teste.com     |

@pesquisaEmBranco
Esquema do Cenário: Deve exibir a opção para cadastrar um novo usuário se nada for localizado pela pesquisa
  Quando pesquisar um usuário pelo texto "<pesquisa>"
  Então irei visualizar a opção para cadastrar um novo usuário
  Exemplos:
  | pesquisa               |
  | usuarionaoexiste       |
  | teste@emailinexistante |