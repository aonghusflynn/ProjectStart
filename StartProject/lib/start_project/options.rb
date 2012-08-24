require 'optparse'
module StartProject
  class Options
    # TODO
    # 1. Create a class to store/read from YAML, all the different frameworks possible
    # 2. Clean up the unpacking
    # 3. Create Tests
    # 4. Write documentation
    
    
    DEFAULT_TYPE = "html5"
    attr_reader :project_uri
    attr_reader :project_name
    
    def initialize(argv)
      @project_uri = "https://github.com/h5bp/html5-boilerplate/zipball/master"
      parse(argv)
    end
    
    private 
    def parse(argv)
      OptionParser.new do |opts|
        opts.banner = "Usage: ProjectStart -t [ html5 | bootstrap] -n projectName"
        
        opts.on("-t","--type html5|bootstrap", String, "Type of project") do |type|
          if(type=='bootstrap')
             @project_uri = ""
           else
             @project_uri = "https://github.com/h5bp/html5-boilerplate/zipball/master"
           end
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