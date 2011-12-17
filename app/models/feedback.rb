class Feedback < ActiveRecord::Base
  belongs_to :aula

  validates :aula_id, :presence => true
  validates :valor, :presence => true
  validates_inclusion_of :valor, :in => 1..5
  validates_uniqueness_of :user_id, :scope => :aula_id

  def self.getFeedbackAula(aid)

    feedbacks = Feedback.where(:aula_id => aid)
    
    if feedbacks.count > 0
        "%0.10f" % (feedbacks.sum(:valor).to_f/feedbacks.count.to_f)
    else
        0
    end

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
        "%0.10f" % (total.to_f/count.to_f)
    else
        0
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
        "%0.10f" % (total.to_f/count.to_f)
    else
        0
    end


  end 
end
