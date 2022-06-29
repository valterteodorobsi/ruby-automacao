require 'json'
require 'ostruct'
require 'yaml'
require 'logger'

def inicia_data()
  dir = "#{Dir.pwd}/features/data/"

  data = @data

  Dir.foreach(dir) do |filename|
    next if filename == '.' or filename == '..'
    area = File.basename(filename, ".yaml").to_s
    data["#{area}"] = YAML.load_file("#{dir}/#{filename}")
  end

  @data = data

end

def inicia_data_env()
  dir = "#{Dir.pwd}/config"

  data = @data

  Dir.foreach(dir) do |filename|
    next if filename == '.' or filename == '..'
    area = File.basename(filename, ".yaml").to_s
    data["#{area}"] = YAML.load_file("#{dir}/#{filename}")
  end

  @data = data

end