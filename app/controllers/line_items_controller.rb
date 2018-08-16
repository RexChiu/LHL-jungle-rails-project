# frozen_string_literal: true

class LineItemsController < ApplicationController
  def show
    @line_item = LineItem.find(params[:id])
  end
end
