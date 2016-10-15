class ReviewsController < ApplicationController

  def show
    @review = Review.find params[:id]
  end

  def create
    @review = Review.new(review_params)
    @product = Product.find_by params['product_id']

    if @review.save
      redirect_to [@product], notice: 'Review created!'
    else
      puts @reviews.errors.to_a
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id
    )
  end

end