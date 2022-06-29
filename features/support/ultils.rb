
def screenshot(step)
  #screenshot = Base64.encode64(File.open(screenshot, "rb").read)
  env = ENV['BROWSER']
  screenshot = page.save_screenshot("allure-results/#{env}/#{@cenario_name} - #{step.gsub(/([@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')}.png")
  Allure.add_attachment(name:
                          "#{@cenario_name} - #{step}",
                        source: File.open(screenshot),
                        type: Allure::ContentType::PNG,
                        test_case: true)
end


#anexa direto o binário da screenshot no relatório
module Allure
  class FileWriter
    def write(name, source)
      filename = File.join(output_dir, name)
      File.open(filename, "w") { |file| file.write(source) }
    end
  end
end