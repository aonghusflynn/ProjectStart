#Stub for the entry class
require 'open-uri'

module StartProject
  class Downloader
    
    HTMl5_URI = "https://github.com/h5bp/html5-boilerplate/zipball/master"
    def download
      open('html5.zip','wb') do |fo|
        fo.print open(HTML5_URI).read
      end
      
      extract
    end

    def extract
      
    end

  end
end
