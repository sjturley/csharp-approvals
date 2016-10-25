require 'sinatra'
require 'sinatra/base'

class Demo < Sinatra::Base

  get '/' do

    '<pre>Hello world</pre>'
    #'<pre>' + JSON.pretty_unparse(json) + '</pre>'
  end

end


