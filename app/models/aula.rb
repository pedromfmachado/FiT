class Aula < ActiveRecord::Base
  belongs_to :turno
  belongs_to :staff
  belongs_to :estudio
  belongs_to :tipo_aula

  validates :turno_id, :presence => true
  validates :estudio_id, :presence => true
  validates :staff_id, :presence => true
  validates :tipo_aula_id, :presence => true
  validates :diaSemana, :presence => true
  validates :ginasio_id, :presence => true

  validates_uniqueness_of :staff_id, :scope => [:turno_id, :diaSemana]
  validates_uniqueness_of :estudio_id, :scope => [:turno_id, :diaSemana]
end
