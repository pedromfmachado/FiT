class ReservaAula < ActiveRecord::Base

  belongs_to :aula
  belongs_to :user

  validates_presence_of :aula_id, :message => "em branco."
  validates_presence_of :user_id, :message => "em branco."
  validates_presence_of :dia, :message => "em branco."
  validates_uniqueness_of :user_id, :scope => [:aula_id, :dia]

  validate :checkLotacao, :checkHora, :checkDia


  def self.jaMarcada(uid,aid)
    ReservaAula.where(:user_id => uid, :aula_id => aid, :dia => Date.today).count > 0
  end

  def self.getReserva(uid,aid,d)
    reservas = ReservaAula.where(:user_id => uid, :aula_id => aid, :dia => d)

    if reservas.count > 0
      reservas[0]
    end		
  end

  def self.lugaresDisponiveis(aid)
    aula = Aula.find(aid)
    estudio = Estudio.find(aula.estudio_id)
    estudio.lotacao - ReservaAula.where( :aula_id => aid, :dia => Date.today).count
  end

  def checkLotacao
    if ReservaAula.lugaresDisponiveis(aula_id) < 0
      errors.add(:lotacao , "A aula ja esta completa")
    end
  end

  def checkHora
    if aula.jaPassou
      errors.add(:hora , "A hora da aula ja passou")
    end
  end

  def checkDia
    if Date.today.wday-1 != aula.dia
      errors.add(:hora , "Esta aula nao existe hoje")
    end
  end

  require 'builder'
  def self.info(uid, aid)
    aula = Aula.find(aid)
    estudio = Estudio.find(aula.estudio_id)

    xml = ::Builder::XmlMarkup.new
    xml.instruct!
    xml.reserva do
      xml.dia Time.now.wday-1
      xml.data Time.now.strftime("%Y/%m/%d")
      xml.hora Time.now.hour.to_s + ':' + Time.now.min.to_s
      xml.lugares ReservaAula.lugaresDisponiveis(aula.id)
      xml.lotacao estudio.lotacao

      xml.feedback Feedback.getFeedbackAula(aid)

      if ReservaAula.jaMarcada(uid,aula.id)
        xml.tem_reserva "sim"
      else
        xml.tem_reserva "nao"
      end

    end
  end

end

