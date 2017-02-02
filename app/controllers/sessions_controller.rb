require 'net/http'
require 'json'

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])

    if user.valid?
      msg = user.email + "," + user.username

      uri = URI('http://master.drie-flask-services.app.push.drieapp.co/send-slack-msg-to-drie')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = {channel: '#signups', msg: msg}.to_json

      # Write email to slack channel #signups
      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
      end

      puts res.body

      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin']
    end
  end

  def destroy
    #reset_session
    session[:user_id] = nil
    redirect_to request.referer
  end
end
