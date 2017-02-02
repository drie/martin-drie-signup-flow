require 'net/http'
require 'json'

class SessionsController < ApplicationController
  def new
  end

  def create
    logger.debug "Session#create called..."
    user = User.from_omniauth(env["omniauth.auth"])

    logger.debug "user.email: #{user.email}"
    if user.valid?
      msg = user.email + "," + user.username
      send_slack_msg("@martin", msg)

      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin']
    end
  end

  def destroy
    logger.debug "Destroying session..."
    reset_session
    redirect_to request.referer
  end


  def send_slack_msg(channel, msg)
    uri = URI('http://master.drie-flask-services.app.push.drieapp.co/send-slack-msg-to-drie')
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = {channel: channel, msg: msg}.to_json

    # Write email to slack channel #signups
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    logger.debug res.body
  end
end
