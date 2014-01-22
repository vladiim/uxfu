require 'rubygems'
require 'sinatra'
require 'json'

# use Rack::Auth::Basic, "Restricted Area" do |username, password|
#   username == 'uname' and password == 'password'
# end

get '/home' do
  erb :index, locals: { content: 'home', logged: 'out' }
end

get '/user_journeys' do
  erb :index, locals: {
    content: 'user_journeys',
    logged: 'out',
    user_journeys: [ { title: "First user journey" }, { title: "2nd UJ" } ]
  }
end