class EstatisticasController < ApplicationController

  def index
    
    @ginasio = Ginasio.find(params[:ginasio_id])

    respond_to do |format|
      format.html
    end

  end

  def total_ginasio
    respond_to do |format|
      format.xml { render :xml => message(Estatistica.totalGinasio(params[:ginasio_id].to_i,params[:ano].to_i))}
    end
  end

  def aulas_professor
    respond_to do |format|
      format.xml { render :xml => message(Estatistica.numerosPorProfessorTotal(params[:taid].to_i,params[:ginasio_id].to_i,params[:mes].to_i,params[:ano].to_i))}
    end
  end

  def modalidade_professor
    respond_to do |format|
      format.xml { render :xml => message(Estatistica.numerosPorProfessor(params[:taid].to_i,params[:ginasio_id].to_i,params[:mes].to_i,params[:ano].to_i))}
    end
  end

  def modalidade_semana
    respond_to do |format|
      format.xml { render :xml => message(Estatistica.numerosPorDiaSemana(params[:taid].to_i,params[:ginasio_id].to_i,params[:mes].to_i,params[:ano].to_i))}
    end
  end

  def modalidade

    respond_to do |format|
      format.xml { render :xml => message(Estatistica.numerosPorModalidade(params[:ginasio_id].to_i,params[:mes].to_i,params[:ano].to_i))}
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
