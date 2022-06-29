class HomePageInicial < SitePrism::Page

  set_url '/'
  element :mensagem_bemvindo, :xpath, "//div[contains(text(),'Bem vindo')]"
  element :mensagem_erro, :xpath, "//div[@class='alert alert-danger']"

  def validar_menu_presente?
    mensagem_bemvindo.visible?
  end

  def validar_erro_presente?
    mensagem_erro.visible?
  end
end