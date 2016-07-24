class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable,
         :omniauthable

  validates_presence_of :name

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
      end
    end
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def display_name
    self.name || self.email
  end

end
