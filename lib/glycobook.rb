require 'open-uri'
require 'net/http'
require 'fileutils'
module GlycoBook
def self.init

  require 'open-uri'

  # ダウンロード先と保存先の情報を配列で定義
  downloads = [
    {
      url: "https://gitlab.com/glycoinfo/wurcsframework/-/package_files/73054558/download",
      file: "jar/wurcsframework.jar"
    },
    {
      url: "https://gitlab.com/glycoinfo/wurcsframework/-/package_files/73054558/download",
      file: "jar/wurcsframework-1.2.13.jar"
    },
    {
      url: "https://gitlab.com/glycoinfo/wurcsframework/-/package_files/70458150/download",
      file: "jar/wurcsframework-1.0.1.jar"
    },
    {
      url: "https://repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.7/slf4j-api-2.0.7.jar",
      file: "jar/slf4j-api.jar"
    },
    {
      url: "https://gitlab.glyco.info/glycosmos/subsumption/subsumption/-/package_files/238/download",
      file: "jar/subsumption.jar"
    },
    {
      url: "https://gitlab.glyco.info/glycosmos/glytoucangroup/archetype/lib/-/package_files/334/download",
      file: "jar/archetype.jar"
    },
    {
      url: "https://gitlab.com/glycoinfo/glycanformatconverter/-/package_files/81149971/download",
      file: "jar/glycanformatconverter.jar"
    },
    {
      url: "https://raw.githubusercontent.com/glycoinfo/MavenRepository/master/org/eurocarbdb/MolecularFramework/1.0.0/MolecularFramework-1.0.0.jar",
      file: "jar/MolecularFramework.jar"
    }
  ]
  folder_path = File.dirname(__FILE__)+"/jar"
  unless Dir.exist?(folder_path)
    FileUtils.mkdir_p(folder_path)
    puts "Folder created: #{folder_path}"
  else
    puts "Folder already exists: #{folder_path}"
  end
  # ダウンロードを実行する
  downloads.each do |download|
    uri = URI(download[:url])
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      begin
        File.open(File.dirname(__FILE__)+"/"+download[:file], 'wb') do |file|
          file.write(response.body)
          puts "Installed " + file.to_s
        end
      rescue StandardError => e
        puts "Failed to save file: #{download[:file]}. Error: #{e.message}"
      end
    else
      puts "Failed to download file: #{download[:file]}"
    end
  end
end
end
  
