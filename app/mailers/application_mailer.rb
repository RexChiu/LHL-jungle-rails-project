# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Cats@jungle.com'
  layout 'mailer'
end
