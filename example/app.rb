begin
  require 'sinatra'
  require 'omniauth'
  require 'omniauth-backlog'
  require 'cgi'
rescue LoadError
  require 'rubygems'
  require 'sinatra'
  require 'omniauth'
  require 'omniauth-backlog'
  require 'cgi'
end

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :backlog, ENV['CLIENT_ID'], ENV['CLIENT_SERCRET'], :client_options => { :site => ENV['CLIENT_ENDPOINT'] }
end


get '/' do
  <<-HTML
  <a href='/auth/backlog'>Sign in with Backlog</a>
  HTML
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  # do whatever you want with the information!
  CGI::escapeHTML(auth.to_s)
end