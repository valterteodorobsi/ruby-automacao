# frozen_string_literal: true
require 'cucumber'
require 'cucumber/rake/task'
require 'yaml'

Dir.glob('rake_tasks/*.rake').each { |r| load r }

desc 'Executar os testes selecionando o ambinete e o  browser (chrome|firefox), e.g.: single_run_acceptance[des,chrome,@login]'
task :single_run_acceptance, :brand_environment, :browser, :tags do |_, args|
  brand_environment = args[:brand_environment]

  check_params(brand_environment)

  Cucumber::Rake::Task.new(:execute) do |task|
    if tags
      task.cucumber_opts = [
        '--profile reports',
        "--profile #{brand_environment}",
        "--tags #{tags}"
      ]
    else
      task.cucumber_opts = [
        '--profile reports',
        "--profile #{brand_environment}"
      ]
    end
  end

  Rake::Task[:execute].invoke


  begin
    result = run_rake_task('run_acceptance', args[:brand_environment], args[:browser], args[:tags])

  rescue StandardError => e
    puts "#{e.class}: #{e.message}"
  end

  raise 'Os testes do cucumber falharam' unless result
  def check_params(environment)
    raise 'Ambiente não suportados.' unless %w(prod uat des).include? environment

    puts 'Nenhuma tag informada, todos os testes serão executados.' unless tags
  end
end

