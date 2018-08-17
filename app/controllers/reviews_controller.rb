class ReviewsController < ApplicationController
  def create
    puts "review_params: #{review_params}"
    @review = Review.new(review_params)

    if @review.save
      redirect_to product_url(params[:product_id]), notice: 'review created!'
    else
      redirect_to product_url(params[:product_id]), notice: 'some failure'
    end
  end

  private

  def review_params
    user_id = current_user ? current_user.id : -1
    puts "User ID: #{user_id}"
    puts "Current User: #{current_user}"
    params.require(:review).permit(
      :description,
      :rating,
    ).merge(product_id: params[:product_id], user_id: user_id)
  end
end
