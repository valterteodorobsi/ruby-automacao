class LoginPage < SitePrism::Page
  set_url 'https://seubarriga.wcaquino.me/login'
  element :input_login, :id, 'email'
  element :input_senha, :id, 'senha'
  element :btn_continuar, :xpath, "//button"
  element :backoffice, :xpath, "//div[@class='alert alert-danger']"


  def preencher_email email
    btn_continuar.visible?
    input_login.set email
  end

  def preencher_sehha_login senha
    input_senha.set senha
  end

  def clicar_entrar
    btn_continuar.disabled?
    btn_continuar.visible?
    btn_continuar.click
    #screenshot("Entar")
  end

  def clicar_entrar_invalido
    btn_continuar.disabled?
    btn_continuar.visible?
    btn_continuar.click
    sleep 1
  end

  def preencher_email_invalido
    input_login.set 'Testes@gamail.com'
  end

  def preencher_senha_invalida
    input_senha.set '00000000'
  end

end