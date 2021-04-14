class ApplicationMailer < ActionMailer::Base
  default from: 'contact@my-library.xyz'
  layout 'mailer'
end
