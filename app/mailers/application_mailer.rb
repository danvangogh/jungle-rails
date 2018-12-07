class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def application_mailer(email, order)
    @order = order
    @email = email
    mail(to: @email, subject: "Order #{@order.id} Confirmed",
    template_path: '../views/layouts',
    template_name: 'application_mailer')
  end

end
