Dado(/^que acesso a pagina inicial para realizar o login$/) do
  @apps.home_shared_page.load
end

Quando(/^digito o "([^"]*)" e "([^"]*)"$/) do |email, senha|

  email =CONFIG["loginAdm"]["nome"]
  @apps.home_shared_page.preencher_email email
  senha = CONFIG["loginAdm"]["senha"]
  @apps.home_shared_page.preencher_sehha_login senha
  @apps.home_shared_page.clicar_entrar
end

Entao(/^devo acessar a tela inicial do cadastro de signatairos "([^"]*)"$/) do |msgsucesso|
  expect(@apps.home_shared_page_inicial).to have_content msgsucesso
  @apps.home_shared_page_inicial.clicar_em_paramentros
  @apps.home_shared_page_inicial.clicar_em_consultar_de_signatarios

  expect(@apps.home_shared_page_inicial.validar_botao_cadastrar?).to be true
end

Entao(/^devo voltar a tela anterior a tela inicial$/) do
  @apps.home_shared_page_inicial.clicar_em_paramentros
  @apps.home_shared_page_inicial.clicar_em_consultar_de_signatarios
  @apps.home_shared_page_inicial.clicar_em_voltar_tela_consulta
  expect(@apps.home_shared_page_inicial.validar_home_cadastar?).to be true

end

Quando(/^digito um usuário incorreto$/) do
  @apps.home_shared_page.preencher_email_invalido
  @apps.home_shared_page.preencher_senha_invalida
  @apps.home_shared_page.clicar_entrar_invalido
end

Quando(/^digito o "login" correto e senha inválida$/) do
  email = @data["user"]["loginAdm"]["nome"]
  @apps.home_shared_page.preencher_email email
  @apps.home_shared_page.preencher_senha_invalida
  @apps.home_shared_page.clicar_entrar_invalido
end

When(/^digito o "([^"]*)"$/) do |arg|
  email = CONFIG["#{arg}"]["email"]
  @apps.home_shared_page.preencher_email email
  senha = CONFIG["#{arg}"]["senha"]
  @apps.home_shared_page.preencher_sehha_login senha
  @apps.home_shared_page.clicar_entrar
end

When(/^sera apresentado a tela do menu principal$/) do
  expect(@apps.home_shared_page_inicial.validar_menu_presente?).to be true
end

When(/^sera apresentado uma mensagem de erro$/) do
  expect(@apps.home_shared_page_inicial.validar_erro_presente?).to be true
end