class RealtimeController < ApplicationController
  #skip_before_filter :authenticate
  def verify
    render :text => params["hub.challenge"]
  end

  def change
    puts params.inspect
    render :nothing => true
  end
end