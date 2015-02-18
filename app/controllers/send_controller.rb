class SendController < ApplicationController
  def get_address
  end

  def send_email
    params[:address]
    SendMailer.invitation(params[:address]).deliver_now
  end
end
