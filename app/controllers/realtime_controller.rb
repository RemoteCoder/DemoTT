class RealtimeController < ApplicationController
  def verify
    render :text => params["hub.challenge"]
  end

  def change
    puts params.inspect
    render :nothing => true
  end
end