require 'rubygems'
require 'sinatra'
require 'json'
require "#{Dir.pwd}/src/ruby/user_journeys"

# use Rack::Auth::Basic, "Restricted Area" do |username, password|
#   username == 'uname' and password == 'password'
# end

get '/home' do
  erb :index, locals: { content: 'home', logged: 'out' }
end

get '/user_journeys' do
  length = USER_ONE_UJ.length
	erb :index, locals: {
    content: 'user_journeys',
    logged: 'out',
    user_journeys: USER_JOURNEYS,
    uj_length: length
  }
end