class User < ActiveRecord::Base
  include Paperclip::Glue   

  has_many :admins
  has_many :staffs
  has_many :planos
  has_attached_file :avatar, :styles => {:small => "150.150>"}

  attr_accessible :email, :password, :password_confirmation, :nome, :morada, :telefone, :datanascimento, :avatar

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
  validates_attachment_presence :avatar, :notice => "Deve fazer upload de uma imagem"
  
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

  def promote

    if normal?
      Staff.create(:user_id => id)
    elsif staff?
      Admin.create(:user_id => id)
      Staff.find_by_user_id(id).destroy
    end
     
  end

  def demote

    if admin?
      Staff.create(:user_id => id)
      Admin.find_by_user_id(id).destroy
    elsif staff?
      Staff.find_by_user_id(id).destroy
    end
  end

end
