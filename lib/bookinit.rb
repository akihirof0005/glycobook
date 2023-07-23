require 'open-uri'
require 'net/http'
require 'fileutils'
require 'yaml'

module BookInit

  def self.load_settings(file_path)
    downloads = []

    if File.exist?(file_path)
      downloads = YAML.load_file(file_path)
    else
      unless Dir.exist?(ENV['HOME'] + "/.glycobook")
        Dir.mkdir(ENV['HOME'] + "/.glycobook")
      end
      FileUtils.mv(File.dirname(File.expand_path(__FILE__)) + "/../jar.yml", file_path)
      puts "please open file:~/.glycobook/jar.yml and edit eula"
      exit
    end

    downloads
  end

  def self.run


    # YAMLファイルからdownloads情報をロード
    downloads = load_settings(ENV['HOME'] + "/.glycobook/jar.yml")
    unless downloads["eula"]
      puts "please open file:~/.glycobook/jar.yml and edit eula" 
      exit
    end

    require 'open-uri'

    folder_path = File.dirname(__FILE__)+"/jar"
    unless Dir.exist?(folder_path)
      FileUtils.mkdir_p(folder_path)
      puts "Folder created: #{folder_path}"
    else
      puts "Folder already exists: #{folder_path}"
    end
    # ダウンロードを実行する
    downloads["list"].each do |download|

      uri = URI(download["url"])
      response = Net::HTTP.get_response(uri)
      if response.is_a?(Net::HTTPSuccess)
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

