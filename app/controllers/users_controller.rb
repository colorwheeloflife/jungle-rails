class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if User.where(:email => user.email).exists?
      raise 'You have entered an email already in the system.'
      redirect_to '/signup'
    else
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end


  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end


# respond_to do |format|
#   if @user.save
#     # Tell the UserMailer to send a welcome email after save
#     UserMailer.welcome_email(@user).deliver_later

#     format.html { redirect_to(@user, notice: 'User was successfully created.') }
#     format.json { render json: @user, status: :created, location: @user }
#   else
#     format.html { render action: 'new' }
#     format.json { render json: @user.errors, status: :unprocessable_entity }
#   end
# end

# class SendWeeklySummary
#   def run
#     User.find_each do |user|
#       UserMailer.weekly_summary(user).deliver_now
#     end
#   end
# end