class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  validates :email, presence: true

  has_one_attached :profile_picture
  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/

    errors.add :password, 'Complexity requirement not met. Length should be at least characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  # def profile_picture_url
  #   debugger
  #   if profile_picture.attached?
  #     url_for(profile_picture)
  #   else
  #     ActionController::Base.helpers.asset_path('default_profile_picture.png')
  #   end
  # end
end
