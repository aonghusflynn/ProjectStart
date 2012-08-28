require 'rubygems'
require 'test/unit'
require 'shoulda'
require '../lib/start_project/options.rb'
class OptionsTest < Test::Unit::TestCase
  
  context "config.yaml loads" do
    should "return frameworks" do
      opts = StartProject::Options.new(['-n', 'Aonghus'])
      assert_not_nil opts.frameworks
    end
  end
  
  
  context "specifying no framework type" do
    should "return default" do
      opts = StartProject::Options.new(['-n', 'Aonghus'])
      assert_equal opts.project_uri, 'https://github.com/h5bp/html5-boilerplate/zipball/master'
    end
  end
end
