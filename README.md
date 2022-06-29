#front-web-ruby

Ambiente:
- Ruby (versão utilizada para criação do projeto - 2.6.2 >= 3.0.1) com DevKit
https://rubyinstaller.org/downloads/

- Bundler (gem install bundler)

- Chromedriver configurado no path:
Obs.1: faça o download em https://chromedriver.chromium.org/downloads (baixar de acordo com a versão do seu Chrome), descompacte em uma pasta (ex.: C:\chromedriver)
Obs.2: na variável de ambiente PATH, incluir o caminho para a pasta do chromedriver (ex.: C:\chromedriver - sem o chromedriver.exe) - pode ser necessário reiniciar o sistema
Obs.3: no mac instalar o chrome driver por padrão  no comando brew cask install chromedriver

- IDE: VSCode ou RubyMine
--- Extensões úteis no VSCode:
vscode-icons
Cucumber (Gherkin) Full Support
Ruby

- Roteiro para UTILIZAR o projeto:
1. Fazer o clone do projeto
2. Abrir a pasta no VSCode
3. Abrir o terminal (do VSCode, ou o da sua preferência e navegar até a pasta do projeto) e rodar o comando 'bundle install'
4. Para rodar os cenários, utilizar o comando de run do Cucumber sem o relatório. :
  ex.: 
   Cucumber:
  - rodar todos os cenários: 'cucumber'
  - rodar uma feature: cucumber features/specs/01-cadastro_fixo.feature
  - rodar um cenário pela tag: cucumber -t @login
  - rodar todos os cenários por tag: cucumber -t @funcionalidade

5. usando o `rake` para gerar o relatório no allure;
- Para executar a suite de teste: `rake run_acceptance[des,browser,@tag_test]` - sendo ambiente = des/uat/prod, browser = chrome/firefox/safari/internet_explorer e @tag_test = as tags definidas na feature do cucumber
  * Exemplo da execução da Automação da feature `rake run_acceptance[des,chrome,@funcionalidade]`;
  * Exemplo da execução da Automação do cenario `rake run_acceptance[des,chrome,@login]`;
  * Exemplo da execução da Automação usando tags `rake run_acceptance[des,chrome,'"@acceptance and not @wip"']`;


- Roteiro para RECRIAR o projeto:
1. Abrir uma pasta vazia na sua IDE
2. Criar o arquivo Gemfile (sem extensão) e incluir:

source 'https://rubygems.org'

gem 'capybara'
gem 'pry'
gem 'cucumber', '3.1.2'
gem 'rspec'
gem 'selenium-webdriver'
gem 'webdrivers'
gem 'site_prism'
gem 'cpf_faker'
gem 'faker'
gem 'allure-cucumber', '2.13.3'
gem 'test-unit'
gem 'yard'
gem 'yard-cucumber'
gem 'rspec'
gem 'ffi'
gem 'pry'
gem 'rake'
gem 'redcarpet'
gem 'rspec-expectations'
gem 'clipboard'
gem 'rubocop', require: false
gem 'dbi'
gem 'ruby-oci8'

3. Abrir o terminal (do IDE, ou o da sua preferência e navegar até a pasta do projeto) e rodar o comando 'bundle install'


- Extras:
  - Configurações do driver no arquivo env.rb
  - As pages devem estender de SitePrism:Page para utilizar os recursos do SitePrism
  - Conexão com banco de dados oracle separado por ambiente, no arquivo database.rb
  Obs.: Para a conexão com o banco de dados deve conter instalado o instantclient da oracle juntamente com as valiaveis de ambiente oracle_home