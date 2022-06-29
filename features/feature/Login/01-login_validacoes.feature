#language: pt
#encoding: utf-8
@funcionalidade_login
Funcionalidade: Validar acessos da tela de login

    @valida_login_sucesso @validar_login
    Cenário: Validar login com sucesso
        Dado que acesso a pagina inicial para realizar o login
        Quando digito o "login_valido"
        Entao sera apresentado a tela do menu principal

    @valida_login_invalido @validar_login
    Cenário: Validar login com usuario invalido
        Dado que acesso a pagina inicial para realizar o login
        Quando digito o "login_invalido"
        Entao sera apresentado uma mensagem de erro
