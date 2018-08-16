# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_receipt_email
    @user = params[:user_email]
    @subject = "Order ##{params[:order_id]} Placed"
    mail(to: @user_email, subject: @subject)
  end
end
