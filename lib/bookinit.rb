require 'open-uri'
require 'net/http'
require 'fileutils'
require 'yaml'

module BookInit

  flag = false

  def self.load_settings(file_path, flag)
    
    downloads = []
    
    unless Dir.exist?(ENV['HOME'] + "/.glycobook")
      Dir.mkdir(ENV['HOME'] + "/.glycobook")
    end

    folder_path = File.dirname(__FILE__)+"/jar"
    unless Dir.exist?(folder_path)
      FileUtils.mkdir_p(folder_path)
    end

    if File.exist?(file_path)
      downloads = YAML.load_file(file_path)
    else
      FileUtils.cp(File.dirname(File.expand_path(__FILE__)) + "/../jar.yml", file_path)
    end

    if flag
      FileUtils.cp(File.dirname(File.expand_path(__FILE__)) + "/../jar.yml", file_path)
      downloads = YAML.load_file(file_path)
    end

  end

  def self.run
    puts <<-EOT

Would you like to resolve Java dependencies?(No/yes)
    EOT

  case gets.chomp
    when "yes", "YES", "y"
    when "no", "NO", "n"
      exit 1
  end

    puts <<-EOT

Set recommended Java library version? (No/yes)
    EOT

  case gets.chomp
    when "yes", "YES", "y"
      flag = true
  end

  require 'open-uri'

downloads = load_settings(ENV['HOME'] + "/.glycobook/jar.yml", flag)

  # ダウンロードを実行する
  downloads["libraries"].each do |download|

    url = URI(download["url"])
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
  
    request = Net::HTTP::Get.new(url.request_uri)
    response = http.request(request)
  
    if response.code.to_i == 302
      new_location = response['Location']
      url = URI.parse(new_location)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == 'https')
      request = Net::HTTP::Get.new(url.request_uri)
      response = http.request(request)
    end
  
    if response.code.to_i == 200
      begin
        File.open(File.dirname(__FILE__)+"/"+download["file"], 'wb') do |file|
          file.write(response.body)
          puts "Installed " + download["file"]
        end
        rescue StandardError => e
        puts "Failed to save file: #{download["file"]}. Error: #{e.message}"
      end
    else
      puts "Failed to download file: #{download["file"]}"
    end

    end
  end
end

