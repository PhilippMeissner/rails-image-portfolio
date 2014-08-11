class StaticController < ApplicationController
  skip_before_filter :restrict_access, only: %i[legal contact]

  # CHANGE THIS TO YOUR NEEDS
  MAIL_TO = "myemail@example.com"

  def legal
  end

  def contact
  end

  def validate_message
    message_data = params[:contact_data]
    if valid?(message_data)
      send_message(message_data)
      redirect_to root_path, notice: "Message has been sent and will be reviewed shortly."
    else
      redirect_to contact_path, flash: {error: "An error occured. Please try again."}
    end
  end

  # Validate the presence of all form fields
  private
  def valid?(message_data)
    if message_data[:name].present? && message_data[:email].present? && message_data[:subject].present? && message_data[:message].present?
      true
    else
      false
    end
  end

  def send_message(data)
    mail = ActionMailer::Base.mail(to: MAIL_TO, from: data[:email], subject: data[:subject], reply_to: data[:email], body: data[:message]).deliver
  end
end
