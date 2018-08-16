# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_receipt_email(order)
    @order = order
    @subject = "Order ##{@order.id} Placed"
    mail(to: @order.email, subject: @subject)
  end
end
