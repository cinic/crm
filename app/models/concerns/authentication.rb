module Authentication
  extend ActiveSupport::Concern

  included do
    attr_accessor :password
    
    validates_presence_of :name
    validates :email,
      presence: true,
      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
      uniqueness: { case_sensitive: false, if: true }

    # Пользователь может редактировать профиль без изменения пароля
    validates_presence_of :password, on: :create

    before_save :prepare_password, :downcase_email
    before_create { generate_token(:remember_token) }

  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  def reset_remember_token
    generate_token(:remember_token)
  end

  def reset_remember_token_and_save
    reset_remember_token
    save!(validate: false)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(validate: false)
    UserMailer.password_reset(self).deliver
  end

  def logout(cookies)
    reset_remember_token_and_save
    cookies.delete(:remember_token)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end

  def downcase_email
    email.downcase! if email.present?
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  module ClassMethods
    def authenticate(email, pass)
      user = where('email = ?', email.downcase).first
      return user if user && user.password_hash == user.encrypt_password(pass)
    end
  end
end