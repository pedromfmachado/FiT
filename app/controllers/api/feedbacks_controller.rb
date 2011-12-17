class Api::FeedbacksController < ApiController

  def create
      user = User.find_by_token(params[:token])
      feedback = Feedback.new do |feed|

        feed.user_id = user.id
        feed.aula_id = params[:aula_id]
        feed.valor = params[:valor]

      end

      if feedback.save
        render :xml => message("success")
      else
        render :xml => message(feedback.errors.first[1])
      end
  end

  def message(msg)
	    xml = Builder::XmlMarkup.new(:indent=>2)
	    xml.instruct!

	    xml.feedback do
	        xml.message msg
    end
  end

  skip_before_filter :verify_authenticity_token
end
