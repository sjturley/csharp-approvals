require 'sinatra'
require 'sinatra/base'

class Demo < Sinatra::Base

  get '/' do
    output = `ruby -e "require '/app/src/traffic_lights_test.rb'"`
    status = $?.exitstatus
    "<pre>" +
    "status:#{status}\n" +
    "output:#{output}" +
    "</pre>"
  end

end


