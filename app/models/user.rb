class User < ActiveRecord::Base
    
  has_many :admins
  has_many :staffs
  has_many :planos
  attr_accessible :email, :password, :password_confirmation, :nome, :morada, :telefone, :datanascimento

  attr_accessor :password
  before_save :encrypt_password
  before_create :set_token
  before_update :set_token

  validates_confirmation_of :password
  validates :password, :presence => true, :length => { :in => 6..20 }, :on => :create
  validates :nome, :presence => true
  validates :datanascimento, :presence => true
  validates :morada, :presence => true
  validates :telefone, :presence => true
  validates :email, :uniqueness => true, :presence => true, :on => :create
  
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

  def set_token
    self.token = UUIDTools::UUID.timestamp_create
  end

  def admin?
    if(Admin.find_by_user_id(id) != nil) 
      return true
    else
      return false
    end
  end
  
  def staff?
    if(Staff.find_by_user_id(id) != nil) 
      return true
    else
      return false
    end  
  end

  def normal?
    !admin? && !staff? && id != nil
  end

end
