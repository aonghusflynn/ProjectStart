require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'open-uri'
require '../lib/start_project/downloader.rb'
class DownloaderTest < Test::Unit::TestCase
  
  context "Not a 404" do
    should "Not be a 404" do
      file = open('https://github.com/h5bp/html5-boilerplate/zipball/master')
      assert_equal(file.status[0], '200')
    end
  end
  
end