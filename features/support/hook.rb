# # AJUSTAR ESSA CLASS
require 'pry'
require_relative 'data'

Before do
  # @database = Database.new
  @apps = Apps.new
  @data = {}
  inicia_data()


end

Before do |cenario|
  @cenario_name = cenario.name.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
end

AfterStep do |result, step|
  screenshot step.source.last.text
  expect(result).to be_a(Cucumber::Core::Test::Result::Passed)

end


After do |cenario|
   screenshot 'resultado'
   $logger.info("Teste #{@cenario_name} finalizado")
   Capybara.current_session.driver.quit
end
