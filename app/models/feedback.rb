class Feedback < ActiveRecord::Base
  belongs_to :aula

  validates :aula_id, :presence => true
  validates :valor, :presence => true
  validates_inclusion_of :valor, :in => 1..5
  validates_uniqueness_of :user_id, :scope => :aula_id
end
