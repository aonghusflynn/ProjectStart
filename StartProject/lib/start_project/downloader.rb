#Stub for the entry class
require 'rubygems'
require 'open-uri'
require 'zip/zip'

module StartProject
  class Downloader
    def self.download(source)
      open("temp.zip",'wb') do |fo|
        fo.print open(source).read
      end
    end
    
    def self.unzip_file (destination)
      orig_name = ""
      Zip::ZipFile.open("temp.zip") { |zip_file|
       zip_file.each { |f|
         f_path=File.join("./", f.name)
         orig_name = f_path.split('/')[1]
         FileUtils.mkdir_p(File.dirname(f_path))
         zip_file.extract(f, f_path) unless File.exist?(f_path)
       }
      }
      File.rename(orig_name, destination)
      File.delete("temp.zip")
    end
  end
end
