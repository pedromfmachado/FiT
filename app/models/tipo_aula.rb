class TipoAula < ActiveRecord::Base
	validates_presence_of :tipo, :message => "em branco."
	validates_presence_of :descricao, :message =>"em branco."


	def self.getVideoId(url)

		if url.blank?
			""
		elsif url[/youtu\.be\/([^\?]*)/]
			id = $1
		else
			url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
			id = $5
		end

	end

end

