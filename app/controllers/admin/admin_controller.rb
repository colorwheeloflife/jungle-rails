class AdminController < ApplicationController
  # before_filter :authenticate_user!
  # before_filter :require_admin

   http_basic_authenticate_with name: ENV['ADMIN_PUBLISHABLE_KEY'] password: ENV['ADMIN_SECRET_KEY']

   # def edit
   #   render plain: "I'm only accessible if you know the password"
   # end
end