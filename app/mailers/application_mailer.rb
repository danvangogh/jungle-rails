class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def application_mailer(email)
    puts "GOOOOOT HEEREEEEEE!!!!!!!!!"
    mail(to: @email, subject: 'Order Confirmed!',
    template_path: '../views/layouts',
    template_name: 'application_mailer')
  end

end
