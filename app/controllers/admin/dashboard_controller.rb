class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_PUBLISHABLE_KEY'], password: ENV['ADMIN_SECRET_KEY']

  def show
  end
end
