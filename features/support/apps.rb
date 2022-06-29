class Apps
  def home_shared_page
    HomeSharedPage.new
  end

  def home_shared_page_inicial
    HomeSharedPageInicial.new
    end

  def cadastar_signatario_page
    CadastarSignatarioPage.new
  end

  def cadastar_cliente_page
    CadastarClientePage.new
  end

  def contrato_distrato_page
    ContratoDistratoPage.new
  end

  def contrato_proposta_page
    ContratoPropostaPage.new
  end

  def meu_share_page
    MeuShareConsulta.new
  end

  def cadastrar_contratos_page
    CadastrarContratosPage.new
  end

  def cadastrar_cliente_share_page
    CadastrarClienteSharePage.new
  end

  def cadastrar_lead_page
    CadastrarLeadPage.new
  end

  def cadastrar_lead_nao_logada_page
    CadastrarLeadNaoLoadaPage.new
  end

  def validacao_menus_page
    ValidacaoMenusPage.new
  end

  def contrato_servico_page
    ContratoServicoPage.new
  end

  def contrato_aditivo_page
    ContratoAditivoPage.new
  end

  def evento_page
    EventoPage.new
  end
end
