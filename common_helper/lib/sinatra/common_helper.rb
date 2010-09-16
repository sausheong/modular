require 'sinatra/base'

module Sinatra
  module CommonHelper

    def require_login
      redirect_with_message('/login', 'Please login first') unless session[:id]
    end

    def authenticate(email, password)
      response = RestClient.post('https://www.google.com/accounts/ClientLogin', 
      'accountType' => 'HOSTED_OR_GOOGLE', 
      'Email'  => email, 
      'Passwd' => password, 
      :service => 'xapi', 
      :source  => 'Goog-Auth-1.0') do |response, request, result, &block|

        user = User.first :email => email
        if response.code == 200 and not user.nil?
          session[:id] = response.to_s   
          session[:user] = user.id.to_s
          return true        
        end
        return false
      end
    end

    def redirect_with_message(to_location, message)
      flash[:message] = message
      redirect to_location
    end

  end
  helpers CommonHelper
end