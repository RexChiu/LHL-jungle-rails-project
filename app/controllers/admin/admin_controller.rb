# frozen_string_literal: true

class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:username], password: Rails.configuration.admin[:password]
end
