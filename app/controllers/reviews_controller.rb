class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to products_url(@review.product_id), notice: 'review created!'
    else
      redirect_to products_url(@review.product_id), notice: 'some failure'
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :dsecription,
      :rating
    )
  end
end
