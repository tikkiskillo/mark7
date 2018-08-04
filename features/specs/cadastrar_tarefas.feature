# language: pt

Funcionalidade: Cadastro de tarefas
  Para que eu possa organizar minha vida
  Senho um usuário cadastrado
  Posso adicionar novas tarefas no meu Painel

  # Cenário: Nova tarefa
  #   Dado que eu acesso a página de cadastro de tarefas
  #   E preencho o campo nome com 'Fazer compras'
  #   E preencho o campo data com '20/08/2018'
  #   E preencho o campo tags com 'COmpras, Supermercado, Ketchup'
  #   Quando eu clico em cadastrar
  #   Então esta tarefa é cadastrada

  @smoke @login @logout
  Cenário: Nova tarefa
    Dado que o nome da minha tarefa é 'Fazer compras'
    E a data de finalização será '20/08/2018'
    E quero taguear esta tarefa com:
      | tag          |
      | Compras      |
      | Supermercado |
      | Ketchup      |
      | Mostarda     |
      | Maionese     |
    Quando faço o cadastro desta tarefa
    Então devo ver esta tarefa com o status 'Em andamento'
    E devo ver somente 1 tarefa com o nome cadastrado

  @tentativa @login @logout
  Esquema do Cenário: Tentar cadastrar
    Dado que o nome da minha tarefa é '<nome>'
    E a data de finalização será '<data>'
    Quando faço o cadastro desta tarefa
    Então devo ver a seguinte mensagem '<mensagem>'

    Exemplos:
    | nome | data       | mensagem                            |
    | Ler  | 21/08/2018 | 10 caracteres é o mínimo permitido. |
    |      | 22/08/2018 | Nome é obrigatório.                 |

  @dup @login @logout
  Cenário: Tarefa não pode ser duplicada
    Dado que o nome da minha tarefa é 'Ler um livro do Patric'
    E a data de finalização será '22/08/2018'
    Mas eu já cadastrei esta tarefa e esqueci
    Quando faço o cadastro desta tarefa
    Então devo ver a seguinte mensagem 'Tarefa duplicada.'
    E devo ver somente 1 tarefa com o nome cadastrado
