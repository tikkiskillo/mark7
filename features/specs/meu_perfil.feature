#language: pt

Funcionalidade: Meu perfil
    Para que eu possa manter meius dados atualizados
    Sendo um usuário
    Posso completar o meu cadastro do perfil

    @logout
    Esquema do Cenário: Atualizar perfil

        Dado que estou autenticado com "<email>" e "<senha>"
        E acesso o meu perfil
        Quando completo o meu cadastro com "<empresa>" e "<cargo>"
        Então devo ver a mensagem de atualização cadastral:
        """
        Perfil atualizado com sucesso.
        """

            Exemplos: 
                | email             | senha  | empresa   | cargo      |
                | wade@teste.com.br | 123456 | Yahoo     | Developer  |
                | wade@teste.com.br | 123456 | Google    | QA         |
                | wade@teste.com.br | 123456 | Microsoft | CEO        |
                | wade@teste.com.br | 123456 | Linkedin  | CTO        |
                | wade@teste.com.br | 123456 | Facebook  | Estagiario |
    