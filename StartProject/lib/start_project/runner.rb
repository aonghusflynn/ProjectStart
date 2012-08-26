require 'start_project/downloader'
require 'start_project/options'
module StartProject
  class Runner
    def initialize(argv)
      @options = Options.new(argv)
    end
    
    def run
      Downloader.download(@options.project_uri)
      Downloader.unzip_file(@options.project_name)
    end
    
  end
end