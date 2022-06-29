require 'rspec'
require 'capybara/cucumber'
require 'site_prism'
require 'faker'
require 'cpf_faker'
require 'allure-cucumber'
require 'selenium-webdriver'


time  = Time.new
time = time.strftime('%d-%m-%Y')
$logger = Logger.new("./exec-logs/exec-log-#{time}.log")



env = ENV['BROWSER']
brand_environment = ENV['URI']
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/config/#{brand_environment}.yaml"))


Capybara.register_driver :site_prism do |app|
  case env
  when 'chrome'
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  when 'firefox'
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  when 'Edge'
    Capybara::Selenium::Driver.new(app, browser: :internet_explorer)
  when 'safari'
    Capybara::Selenium::Driver.new(app, browser: :safari)
  end


end

Capybara.register_driver :site_prism do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: { browser: 'ALL' })
  opts = Selenium::WebDriver::Chrome::Options.new
   opts.add_preference('intl.accept_languages', 'pt-BR')
  # chrome_args = %w[--no-sandbox --disable-popup-blocking --enable-features=NetworkService,NetworkServiceInProcess --window-size=1920,1080]
   chrome_args.each { |arg| opts.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts, desired_capabilities: caps)

end

Capybara.configure do |config|
  config.run_server = false
  Capybara.default_driver = :selenium_chrome_headless
  opts = Selenium::WebDriver::Chrome::Options.new
  opts.add_preference('intl.accept_languages', 'pt-BR')
  #selenium_chrome_headless #roda com o nageador em background  :selenium_chrome
  Capybara.page.driver.browser.manage.window.maximize
  config.app_host = CONFIG['url']
  # ajuste para lingaguem  campos de data que por padrao dependende da maquina vem em MM/DD/YYYY
  # não implemetado o header ainda
  # Capybara.page.driver.add.header
  config.default_max_wait_time = 10
end



Allure.configure do |config|
  config.results_directory = './allure-results/'
  config.clean_results_directory = false
end

def esvaziar_pasta(caminho_pasta)
  Dir.foreach(caminho_pasta) do |arquivos|
    arquivo = File.join(caminho_pasta, arquivos)
    if (arquivos != '.' && arquivos != '..' && arquivos != '.gitkeep' && arquivos != 'environment.properties')
      File.delete(arquivo)
    end
  end
end
#tmp = esvaziar_pasta("#{Dir.pwd}/allure-results/#{env}")
esvaziar_pasta("#{Dir.pwd}/allure-results/#{env}")