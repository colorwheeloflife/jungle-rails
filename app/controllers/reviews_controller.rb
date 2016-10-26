class ReviewsController < ApplicationController

  def show
    @review = Review.find params[:id]
  end

  def create
    @review = Review.new(review_params)
    @product = Product.find(@review.product_id)
    @review.user = current_user
    if @review.save
      redirect_to [@product], notice: 'Review created!'
    else
      puts @reviews.errors.to_a
    end
  end

  def destroy
    @review = Review.find params[:id]
    @product = Product.find_by params['product_id']
    @review.destroy
    redirect_to [@product], notice: 'Review deleted!'
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