class UserMailer < ActionMailer::Base
  default from: Settings.mailer.sender_address

  def deliver_to_kindle(user, resource)
    @user = user
    @resource = resource
    attachments["#{@resource.try(:attachment).try(:file_name)}"] = File.read("#{Rails.root}/public#{@resource.download_link}")
    mail to: @user.email, subject: "The #{@resource.try(:book).try(:name)} has sended to your email."
  end
end
