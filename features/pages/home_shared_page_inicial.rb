class HomeSharedPageInicial < SitePrism::Page

  #set_url '#/home'
  element :paramentros, :xpath, "//p[contains(text(),'Parâmetros')]"
  element :consultar_signatarios, :xpath, "//p[contains(text(),'Consulta de signatários')]"
  element :btn_cadastrar, :xpath, "//span[contains(text(),'Cadastrar')]"
  element :btn_voltar_consultar, :xpath, "//span[contains(text(),'Voltar')]"
  element :label_consultar, :xpath, "//p[contains(text(),'Consulta de signatários')]"

  #Validacão de cada menu da tela Home e menus laterais#
  element :meushare, :xpath, "//p[contains(text(),'Meu Share')]"
  element :menuclienteshare, :xpath, "//p[contains(text(),'Clientes Share')]"
  element :menubackoffice, :xpath, "//a[(@href='#/')]"
  element :menuserbackoffice, :xpath, "//p[contains(text(),'Usuários Backoffice')]"
  element :menusolicitacoes, :xpath, "//p[contains(text(),'Solicitações')]"
  element :menueventos, :xpath, "//p[contains(text(),'Eventos')]"
  element :menuajuda, :xpath, "//p[contains(text(),'Preciso de ajuda')]"
  element :menumudancas, :xpath, "//p[contains(text(),'Mudanças')]"
  element :menuconteudos, :xpath, "//p[contains(text(),'Conteúdos')]"
  element :menuslubeshare, :xpath, "//p[contains(text(),'Clube share')]"
  element :menucontratos, :xpath, "//p[contains(text(),'Contratos')]"
  element :menuparametros, :xpath, "//p[contains(text(),'Parâmetros')]"
  element :menulathome, :xpath, "//a[contains(@href,'#/home')]"
  element :menulatmeushare, :xpath, "//a[contains(@href,'#/meu-share')]"
  element :menulatcustomers, :xpath, "//a[contains(@href,'#/customers')]"
  element :menulatusers, :xpath, "//a[contains(@href,'#/users')]"
  element :menulatsolicitations, :xpath, "//a[contains(@href,'#/solicitations')]"
  element :menulatevents, :xpath, "//a[contains(@href,'#/events')]"
  element :menulathelp, :xpath, "//a[contains(@href,'#/help')]"
  element :menulatresearch, :xpath, "//a[contains(@href,'#/research')]"
  element :menulatchanges, :xpath, "//a[contains(@href,'#/changes')]"
  element :menulatbenefits, :xpath, "//a[contains(@href,'#/benefits')]"
  element :menulatcontracts, :xpath, "//a[contains(@href,'#/contracts')]"
  element :menulatparameters, :xpath, "//a[contains(@href,'#/parameters')]"
  element :menudrawer, :xpath, "//button[contains(@aria-label,'open drawer')]"
  element :mensagem_bemvindo, :xpath, "//div[contains(text(),'Bem vindo')]"
  element :mensagem_erro, :xpath, "//div[@class='alert alert-danger']"

  def clicar_em_paramentros
    paramentros.visible?
    paramentros.click
  end

  def clicar_em_consultar_de_signatarios
    consultar_signatarios.visible?
    consultar_signatarios.click
  end

  def validar_botao_cadastrar?
    btn_cadastrar.visible?

  end

  def clicar_em_voltar_tela_consulta
    btn_voltar_consultar.visible?
    btn_voltar_consultar.click

  end

  def validar_home_cadastar
    label_consultar.visible?
  end

  def clicar_meushare
    meushare.visible?
    meushare.click
  end

  def clicar_menu_clientes_share
    menuclienteshare.visible?
    menuclienteshare.click
  end

  def clicar_menu_back_office
    menubackoffice.visible?
    menubackoffice.click
  end

  def clicar_menu_usuario_back_office
    menuserbackoffice.visible?
    menuserbackoffice.click
  end

  def clicar_menu_solicitacoes
    menusolicitacoes.visible?
    menusolicitacoes.click
  end

  def clicar_menu_eventos
    menueventos.visible?
    menueventos.click
  end

  def clicar_menu_ajuda
    menuajuda.visible?
    menuajuda.click
  end

  def clicar_menu_mudancas
    menumudancas.visible?
    menumudancas.click
  end

  def clicar_menu_conteudos
    menuconteudos.visible?
    menuconteudos.click
  end

  def clicar_menu_clube_share
    menuslubeshare.visible?
    menuslubeshare.click
  end

  def clicar_menu_contratos
    menucontratos.visible?
    menucontratos.click
  end

  def clicar_menu_parametros
    menuparametros.visible?
    menuparametros.click
  end

  #Menus lateráis
  def clicar_menu_lateral_home
    menulathome.visible?
    menulathome.click
  end

  def clicar_menu_lateral_meushare
    menulatmeushare.visible?
    menulatmeushare.click
  end

  def clicar_menu_lateral_customers
    menulatcustomers.visible?
    menulatcustomers.click
  end

  def clicar_menu_lateral_users
    menulatusers.visible?
    menulatusers.click
  end

  def clicar_menu_lateral_solicitations
    menulatsolicitations.visible?
    menulatsolicitations.click
  end

  def clicar_menu_lateral_events
    menulatevents.visible?
    menulatevents.click
  end

  def clicar_menu_lateral_help
    menulathelp.visible?
    menulathelp.click
  end

  def clicar_menu_lateral_research
    menulatresearch.visible?
    menulatresearch.click
  end

  def clicar_menu_lateral_changes
    menulatchanges.visible?
    menulatchanges.click
  end

  def clicar_menu_lateral_clube_share
    menulatbenefits.visible?
    menulatbenefits.click
  end

  def clicar_menu_lateral_contracts
    menulatcontracts.visible?
    menulatcontracts.click
  end

  def clicar_menu_lateral_parameters
    menulatparameters.visible?
    menulatparameters.click
  end

  def clicar_menu_drawer
    menudrawer.visible?
    menudrawer.click
  end


  def validar_home_cadastar?
    label_consultar.visible?

  end

  def validar_menu_presente?
    mensagem_bemvindo.visible?
  end
  def validar_erro_presente?
    mensagem_erro.visible?
  end
end