require 'start_project/downloader'
require 'start_project/options'
module StartProject
  # The Runner class is the entry point to the app
  class Runner
    # Reads the arguments from the command line and creates a new option object.
    def initialize(argv)
      @options = Options.new(argv)
    end
    
    # The run method is called from the executable. Two static methods download and unzip_file are called, these are the main methods in the gem.
    def run
      Downloader.download(@options.project_uri)
      Downloader.unzip_file(@options.project_name)
    end
    
  end
end