require 'sinatra'
require 'sinatra/base'

class Demo < Sinatra::Base

  get '/' do
    output = `/app/src/run_tests.sh`
    status = $?.exitstatus
    "<pre>" +
    "status:#{status}\n" +
    "output:#{output}" +
    "</pre>"
  end

end
