# frozen_string_literal: true

class OrderMailerPreview < ActionMailer::Preview
  def order_receipt_email
    @order = Order.find(1)
    OrderMailer.order_receipt_email(@order)
  end
end
