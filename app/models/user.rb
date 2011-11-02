class User < ActiveRecord::Base
  
  has_many :admins
  attr_accessible :email, :password, :password_confirmation, :nome, :morada, :telefone, :datanascimento

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def admin?
    Admin.find_by_user_id(id)
  end
  
  def staff?
    Staff.find_by_user_id(id)  
  end

  def normal?
    !admin? && !staff?  
  end

end
