class Feedback < ActiveRecord::Base
  belongs_to :aula
  belongs_to :user

  validates_presence_of :aula_id

  validates_presence_of :valor, :message => "Deve enviar um valor"
  validates_inclusion_of :valor, :in => 1..5, :message => "O valor deve ser entre 1 e 5"

  validates_presence_of :user_id, :message => "Deve indicar um userID"
  validates_uniqueness_of :user_id, :scope => :aula_id, :message => "Ja deu o seu feedback para esta aula"

  validate :check_membro, :check_aula_terminada

  def check_aula_terminada

    ReservaAula.where(:aula_id => aula.id, :user_id => user.id).each do |r|

      if r.dia < Date.today
        return
      elsif r.dia == Date.today && aula.jaPassou
        return
      end

    end

    errors.add(:frequencia , "Deve ter frequentado a aula para poder votar")

  end

  def check_membro
    if self.user_id.blank? || self.aula_id.blank?
      return
    end

    if !User.find(user_id).normal?
      errors.add(:tipo , "Apenas os membros nao administrativos podem votar")
    end
  end


  def self.getFeedbackUser(uid,aid)
    feedback = Feedback.where(:user_id => uid, :aula_id => aid)

    if feedback.count > 0
      "%0.1f" % feedback.first.valor
    else
      0.0
    end
  end


  def self.getFeedbackAula(aid)
    "%0.1f" % Feedback.where(:aula_id => aid).average(:valor).to_f
  end


  def self.getFeedbackProf(uid)
    count = 0
    total = 0

    Feedback.all.each do |feed|
        if feed.aula.staff_id == uid
            count += 1
            total += feed.valor
        end
    end

    if count > 0
        "%0.1f" % (total.to_f/count.to_f)
    else
        0.0
    end
  end


  def self.getFeedbackModalidade(taid)
    count = 0
    total = 0

    Feedback.all.each do |feed|
        if feed.aula.tipo_aula_id == taid

            count += 1
            total += feed.valor

        end
    end

    if count > 0
        "%0.1f" %(total.to_f/count.to_f)
    else
        0.0
    end
  end 

end

