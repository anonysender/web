require 'mailer'

class MailsController < ActionController::Base
  before_filter :mail_params, only: :create

  def create
    if Mailer.email!(params)
      render json: { success: true }
    else
      render status: :bad_request, json: { success: false }
    end
  end

  def new
    render :layout => false
  end

  private

  def mail_params
    params.permit(:to, :subject, :body)
  end

end
