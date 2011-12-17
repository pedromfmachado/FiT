class Aula < ActiveRecord::Base
  belongs_to :staff
  belongs_to :estudio
  belongs_to :tipo_aula
  belongs_to :ginasio

  has_many :reserva_aulas

  validates_presence_of :staff_id, :message => "em branco. Selecione um professor."
  validates_presence_of :dia, :message => "em branco. Selecione um dia da semana."

  validates_presence_of :inicio, :message => "da aula em branco. Introduza uma hora valida. (ex: 9:00)"
  validates_format_of :inicio, :message => "da aula invalido. Introduza uma hora valida.",
    :with => /^([01]?\d|2[0-3]):([0-5]\d)$/,
    :unless => Proc.new { |aula| aula.inicio.blank? }

  validates_presence_of :duracao, :message => "da aula em branco. Introduza uma duracao valida (em minutos)."
  validates_numericality_of :duracao, :message => "da aula invalida. Introduza uma duracao valida (em minutos).",
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 720,
    :unless => Proc.new { |aula| aula.duracao.blank? }

  validates_presence_of :tipo_aula_id, :message => "em branco."
  validates_presence_of :estudio_id, :message => "/sala em branco. Selecione uma sala."
  validates_presence_of :ginasio_id, :message => "em branco."

  validate :professor_so_da_uma_aula, :sala_so_tem_uma_aula

  #/( (2[0-3]) | (([0-1]?) (\d{1})) )h(\d{2})/
  #validates_uniqueness_of :staff_id, :scope => [:turno_id, :dia]
  #validates_uniqueness_of :estudio_id, :scope => [:turno_id, :dia]

  def sala_so_tem_uma_aula
    if self.inicio.blank? || self.duracao.blank?
      return
    end

    Aula.all.each do |aula|
      if (aula.inicio + aula.duracao*60) > self.inicio && fim > aula.inicio && aula.estudio_id == self.estudio_id && aula.dia == dia && aula.id != self.id
        errors.add(:sala, "A sala ja esta ocupada nesta hora")
      elsif (self.inicio + self.duracao*60)> aula.inicio && fim < aula.inicio && aula.estudio_id == self.estudio_id && aula.dia == dia && aula.id != self.id
        errors.add(:sala, "A sala ja esta ocupada nesta hora2")
      end
    end
  end

  def professor_so_da_uma_aula
    if self.inicio.blank? || self.duracao.blank?
      return
    end

    Aula.all.each do |aula|
      if (aula.inicio + aula.duracao*60)> self.inicio && fim > aula.inicio && aula.staff_id == self.staff_id && aula.dia == dia && aula.id != self.id
        errors.add(:professor, "O professor ja esta ocupado nesta hora")
      elsif (self.inicio + self.duracao*60)> aula.inicio && fim < aula.inicio && aula.staff_id == self.staff_id && aula.dia == dia && aula.id != self.id
        errors.add(:professor, "O professor ja esta ocupado nesta hora2")
      end
    end
  end

  def fim
    inicio + duracao*60
  end

  def self.getDia(d)
    dias = [ 'Segunda' , 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado', 'Domingo' ]
    if d != nil
      dias[d]
    end
  end

  def jaPassou
    if inicio.hour < Time.now.hour
      return true
    elsif inicio.hour == Time.now.hour
      return inicio.min < Time.now.min
    else
      return false
    end
  end

  require 'builder'
  def to_xml(options ={})
    if options[:builder]
      build_xml(options[:builder])
    else
      xml = Builder::XmlMarkup.new
      xml.instruct!
      build_xml(xml)
    end
  end

  def build_xml(xml)
    xml.aula do
      xml.id id
      xml.data Time.now
      xml.dia dia
      xml.hora inicio.to_s(:time)
      xml.duracao duracao
      xml.ginasio Ginasio.find(ginasio_id).nome
      xml.estudio Estudio.find(estudio_id).nome
      xml.staff User.find(staff_id).nome
      xml.modalidade TipoAula.find(tipo_aula_id).tipo
    end
  end 

end

