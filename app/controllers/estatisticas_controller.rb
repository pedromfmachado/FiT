class EstatisticasController < ApplicationController

  def index
    
    respond_to do |format|
      format.html
    end

  end

  def modalidade_semana
    respond_to do |format|
      format.xml { render :xml => message(ReservaAula.numerosPorDiaSemana(params[:ginasio_id].to_i,params[:taid].to_i,params[:mes].to_i,params[:ano].to_i))}
    end
  end

  def modalidade

    respond_to do |format|
      format.xml { render :xml => message(ReservaAula.numerosPorModalidade(params[:ginasio_id].to_i,params[:mes].to_i,params[:ano].to_i))}
    end
  end

  def message(msg)
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct!

    xml.estatistica do
        xml.message msg
    end
  end

end
