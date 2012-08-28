require 'optparse'
require 'yaml'

module StartProject
  class Options
    # TODO
    # 1. Create a class to store/read from YAML, all the different frameworks possible
    # 2. Clean up the unpacking - Done
    # 3. Create Tests
    # 4. Write documentation
    
    
    DEFAULT_TYPE = "html5"
    attr_reader :project_uri
    attr_reader :project_name
    attr_reader :frameworks

    def initialize(argv)
      @frameworks = begin
	 YAML.load_file(File.join(File.dirname(__FILE__),'config.yaml'))
      rescue ArgumentError => e
         puts "Could not parse YAML #{e.message}"
      end

      @project_uri = @frameworks[:html5]
      parse(argv)
    end
    
    private 
    def parse(argv)
      OptionParser.new do |opts|
        opts.banner = "Usage: ProjectStart -t [ html5 | bootstrap] -n projectName"
        
        opts.on("-t","--type html5|bootstrap", String, "Type of project") do |type|
             @project_uri = @frameworks[type.to_sym]
        end
        
        opts.on("-n","--name projectName", String, "Name of project") do |name|
          @project_name = name
        end
        
        opts.on("-h", "--help", "Show this message") do 
          puts opts
          exit
        end
        
        begin
          argv = ["-h"] if argv.empty?
          opts.parse(argv)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
    end
  end
end
