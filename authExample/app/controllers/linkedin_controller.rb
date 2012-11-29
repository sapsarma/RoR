require 'linkedin'

class LinkedinController < ApplicationController

    
  def index 
   client = LinkedIn::Client.new("2nmn1vbprfxz", "IpyZTDybPZJ87mzH", LINKEDIN_CONFIGURATION )
    request_token = client.request_token(:oauth_callback => 
                                      "http://localhost:3001/linkedin/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url

  end

  def show

    client = LinkedIn::Client.new("2nmn1vbprfxz", "IpyZTDybPZJ87mzH", LINKEDIN_CONFIGURATION )
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
#    @profile = client.profile
     @profile = client.profile(:fields => %w(skills)) 
   #@connections = client.connections
    render 'friendslists/show'
  end
end
