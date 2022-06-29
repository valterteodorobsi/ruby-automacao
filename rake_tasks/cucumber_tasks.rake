require 'cucumber'
require 'cucumber/rake/task'

###
# Tasks
###

desc 'Executar os testes com o browser selecionado (chrome|firefox) Ex.: run_acceptance[chrome,@login]'
task :run_acceptance, :brand_environment,:browser, :tags, :where do |_, args|
  platform_check(args)


  tags = ''
  unless args[:tags].nil?
    tags = "--tags #{args[:tags]}"
  end

  browser = args[:browser]
  brand_environment = args[:brand_environment]
  check_params(args)


  Cucumber::Rake::Task.new(:run) do |t|
    puts "#{tags} #{set_reporting(browser)}"
    t.cucumber_opts = "#{tags} #{set_reporting(browser)}"
  end

  Rake::Task[:run].invoke
end

###
# Helpers
###

def run_rake_task(name, browser, tags)
  begin
    Rake::Task[name].invoke(browser, tags)
  rescue StandardError => e
    puts e.to_s
    return false
  end
  true
end

def set_reporting(browser)
   reporting = "--format AllureCucumber::CucumberFormatter --out allure-results/#{browser}/"
end

def platform_check(args)
  raise 'Por favor defina a plataforma (chrome|firefox)' if args.nil? or args[:browser].nil?

  case args[:browser].downcase
  when 'chrome'
    ENV['BROWSER'] = args[:browser]
  when 'firefox'
    ENV['BROWSER'] = args[:browser]
  when 'Edge'
    ENV['BROWSER'] = args[:browser]
  when 'safari'
    ENV['BROWSER'] = args[:browser]
  else
    raise("Testes não suportados para este browser #{args[:browser]}")
  end
end

  def check_params(args)
    case args[:brand_environment].downcase
    when 'des'
      ENV['URI'] = args[:brand_environment]
    when 'uat'
      ENV['URI'] = args[:brand_environment]
    when 'prod'
      ENV['URI'] = args[:brand_environment]
    else
      raise 'Ambiente não suportados.' unless %w(prod uat des).include? environment
    end
  end
