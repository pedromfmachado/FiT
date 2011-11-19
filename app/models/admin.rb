class Admin < ActiveRecord::Base
  belongs_to :user
  has_many :notificacaos
end
