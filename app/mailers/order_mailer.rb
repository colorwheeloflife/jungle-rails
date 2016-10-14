class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(user, order)
    @user = user
    @order = order
    puts @user.inspect
    delivery_options = { address: 'localhost', port: 1025 }
    mail(
      to: @user.email,
      subject: "Jungle Order: \##{@order.id}",
      delivery_method_options: delivery_options
    )
  end

end
