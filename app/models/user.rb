class User < ApplicationRecord
  def self.from_omniauth(omniauth_return)
    user = find_or_create_by({
      strava_id: omniauth_return["extra"]["raw_info"]["id"]
    })
    user.firstname = omniauth_return["extra"]["raw_info"]["firstname"]
    user.lastname = omniauth_return["extra"]["raw_info"]["lastname"]
    user.email = omniauth_return["extra"]["raw_info"]["email"]
    user.save!
    return user
  end
end
