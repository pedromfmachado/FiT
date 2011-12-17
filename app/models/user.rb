class User < ActiveRecord::Base

  has_many :admins
  has_many :staffs
  has_many :planos
  has_many :reserva_planos

  belongs_to :ginasio
  has_one :pedido_plano

  attr_accessible :email, :password, :password_confirmation, :nome, :morada, :telefone, :datanascimento, :url_foto, :ginasio_id

  attr_accessor :password
  before_save :encrypt_password
  before_create :set_token

  validates :nome, :presence => { :message => "esta em branco." }
  validates_presence_of :datanascimento, :message => "em branco."
  validates_format_of :datanascimento, :message => "invalida. (yyyy/mm/dd)",
    :with => /^(19\d\d|2\d\d\d)([- \/.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$/,

  validates_presence_of :email, :on => :create, :message => "em branco. Introduza o seu email (ex: exemplo@sapo.pt)"
  validates_uniqueness_of :email, :on => :create, :message => "ja existente na base de dados. Introduza outro email."
  validates_format_of :email, :on => :create,
    :unless => Proc.new { |user| (user.email.nil? || user.email.blank?) },
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create,
    :message => "invalido. Introduza o seu email (ex: exemplo@sapo.pt)"

  validates_presence_of :telefone, :message => "em branco."
  validates_format_of :telefone, :unless => Proc.new { |user| (user.telefone.nil? || user.telefone.blank?) },
    :with => /^((\+351|00351|351)(\s{1})?)?(2\d{1}|(9(3|6|2|1)))\d{7}$/, :message => "invalido."

  validates_presence_of :morada, :message => "em branco."
  validates_presence_of :ginasio_id

  validates_presence_of :password, :message => "em branco."
  validates_length_of :password, :in => 6..20, :on => :create,
    :unless => Proc.new { |user| (user.password.nil? || user.password.blank?) },
    :too_long => "demasiado grande. Tem de ter entre 6 a 20 caracteres",
    :too_short => "demasiado pequena. Tem de ter entre 6 a caracteres"
  validates_confirmation_of :password, :message => "diferente."
  
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
    self.token = UUIDTools::UUID.timestamp_create.to_s
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

  

  require 'flickraw'
  def flickr_auth
    FlickRaw.api_key="755298909a3867da9092eb921e173531"
    FlickRaw.shared_secret="3586b0ced741121d"
    flickr.access_token = "72157628068928565-9a350e8521dbe649"
    flickr.access_secret = "85c3c8966a036c44"

    login = flickr.test.login

  end

  def upload_foto(file)


    login = flickr.test.login

    directory = "tmp"
    path = File.join(directory,file.original_filename)
    File.open(path, "wb") { |f| f.write(file.read) }
    
    return flickr.upload_photo path
  end
  
  def get_foto
    FlickRaw.api_key="755298909a3867da9092eb921e173531"
    FlickRaw.shared_secret="3586b0ced741121d"

    info = flickr.photos.getInfo(:photo_id => url_foto)
    return FlickRaw.url_m(info)
  end

  require 'builder'
  def to_xml(options ={})
    xml = ::Builder::XmlMarkup.new(:indent=>2)
    xml.instruct!

    xml.user do
      xml.nome nome
      xml.datanascimento datanascimento
      xml.telefone telefone
      xml.morada morada
      xml.email email
      xml.ginasio ginasio_id
      xml.token token

      if url_foto
        xml.foto get_foto
      else
        xml.foto "http://fitec.heroku.com/images/missing.png"
      end
    end
  end

end

