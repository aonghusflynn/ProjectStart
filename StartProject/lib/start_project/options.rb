require 'optparse'
require 'yaml'

module StartProject
  class Options
    
    # Read the arguments from the command line and parse them out
    
    # project_uri stores the url of the framework
    attr_reader :project_uri
    
    # project_name stores the name of the folder that the final project will live in
    attr_reader :project_name
    
    # frameworks stores the framework details loaded from the config.yaml
    attr_reader :frameworks
    
    
    # = initialize
    # Initializes the options object, loads the config.yaml that stores all the frameworks available 
    # and sets a default framework: html5 boilerplate.
    # Finally, it calls the parse method.
    def initialize(argv)
      @frameworks = begin
      YAML.load_file(File.join(File.dirname(__FILE__),'config.yaml'))
      rescue ArgumentError => e
         puts "Could not parse YAML #{e.message}"
      end

      @project_uri = @frameworks[:html5]
      parse(argv)
    end
    
    # = parse
    # This method reads the options from the command line and acts apropriately.
    # If the user specifies a type (-t or --type), it sets the @project_uri to the location of the framework on the Internet.
    # If the user specifies a name (-n or --name), it sets the @project_name.
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
