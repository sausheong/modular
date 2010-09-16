require 'rubygems'
%w(haml sinatra rack-flash json rest_client active_support).each  { |gem| require gem}
%w(user).each {|model| require model}
%w(sinatra/common_helper middleware).each {|feature| require feature}

set :sessions, true
set :show_exceptions, false
use Rack::Flash
use Middleware::App

get '/' do
  redirect '/dashboard' if session[:id]  
  redirect '/login'
end

get '/login' do haml :login, :layout => false end

post '/login' do  
  if authenticate(params[:email], params[:password])
    redirect '/'
  else
    redirect_with_message '/login', 'Email or password wrong. Please try again'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/dashboard' do
  require_login
  haml :dashboard
end


error do  redirect '/' end