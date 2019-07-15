class UserDecorator < ApplicationDecorator
  delegate :id, :first_name, :second_name, :email, :full_name

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
