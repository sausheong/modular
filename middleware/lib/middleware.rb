require 'sinatra/base'
require 'haml'
require 'order'
require 'sinatra/common_helper'

module Middleware
  class App < Sinatra::Base
    helpers Sinatra::CommonHelper
    
    configure do
      set :public, File.join(File.dirname(__FILE__), '..', 'public')
      set :views, File.join(File.dirname(__FILE__), '..', 'views') 
      set :server_layout, File.read(File.join(File.dirname(File.expand_path($0)), 'views/layout.haml'))           
    end
    
    get '/orders' do
      require_login
      @orders = Order.all      
      haml :list, :layout => settings.server_layout
    end 
   
    get '/orders/:id' do
      @order = Order.get params[:id]
      haml :show, :layout => settings.server_layout
    end
   
  end
end