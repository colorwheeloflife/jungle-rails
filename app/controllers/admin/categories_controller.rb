class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with username: ENV['ADMIN_PUBLISHABLE_KEY'], password: ENV['ADMIN_SECRET_KEY']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
