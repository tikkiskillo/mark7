#language:pt

Funcionalidade: Login
    Para que eu possa cadastrar e gerenciar minhas tarefas
    Sendo um usuário
    Posso acessar o sistema com meu email e senha previamente cadastrados.

    Contexto: Home
        Dado que eu acesso o sistema

    @sprint1 @logout @smoke
    Cenario: Usuário autenticado
        
        Quando faço login com "eu@papito.io" e "123456"
        Então vejo a mensagem de boas vindas "Olá, Fernando"

    @tentativa
    Esquema do Cenario: Tentativa de login

        Quando faço login com "<email>" e "<senha>"
        Então vejo a mensagem de alerta "<saida>"

        Exemplos:
            | email           | senha   | saida                       |
            | eu@papito.io    | xpto123 | Senha inválida.             |
            | eu@papito404.io | xpto123 | Usuário não cadastrado.     |
            |                 | 123456  | Email incorreto ou ausente. |
            | eu@papito404.io |         | Senha ausente.              |
            | eu#papito.io    | asdfgh  | Email incorreto ou ausente. |

