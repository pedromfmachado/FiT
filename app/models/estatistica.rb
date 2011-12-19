class Estatistica < ActiveRecord::Base

require 'gchart'
  def self.numerosPorModalidade(gid, mes, ano)

    titulos = []
    dados   = []
    max     = 0

    TipoAula.all.each do |t|
    
        
        count = 0
        ReservaAula.all.each do |r|

            if r.aula.tipo_aula_id == t.id && r.dia <= Date.today && r.dia.year == ano &&
                r.dia.month == mes && r.aula.ginasio_id == gid

                count += 1

            end

        end
        if count > max
            max = count
        end
        dados << count
        titulos << t.tipo + " (" + count.to_s + ")"
    end

    ::Gchart.bar(:title => 'Modalidades', :size => '330x320', :bar_width_and_spacing => '50,20',
              :axis_with_labels => 'x,y', :data => dados, :axis_labels => [titulos,[0,max]] )

  end

  def self.numerosPorDiaSemana(taid, gid, mes, ano)

    dias = ['Domingo','Segunda','Terca','Quarta','Quinta','Sexta','Sabado']
    titulos = []
    dados   = []
    max = 0

    for i in 0..6
        count = 0
        ReservaAula.all.each do |r|

            if r.aula.tipo_aula_id == taid && r.aula.dia == i && r.dia.year == ano &&
                 r.dia <= Date.today  && r.dia.month == mes && r.aula.ginasio_id == gid

                count += 1

            end

        end
        if count > max
            max = count
        end
        dados << count
        titulos << dias[i] + " (" + count.to_s + ")"
    end

    ::Gchart.bar(:title => TipoAula.find(taid).tipo, :size => '500x300', :bar_width_and_spacing => '50,20',
              :axis_with_labels => 'x,y', :data => dados, :axis_labels => [titulos,[0,max]] )

  end

  def self.numerosPorProfessor(taid, gid, mes, ano)

    professores = Aula.where(:tipo_aula_id => taid, :ginasio_id => gid).select('distinct(staff_id)')
    titulos = []
    dados   = []
    max = 0

    professores.each do |p|
        count = 0
        ReservaAula.all.each do |r|

            if r.aula.tipo_aula_id == taid && r.dia.year == ano &&
                 r.dia <= Date.today  && r.dia.month == mes && r.aula.ginasio_id == gid && p.staff_id == r.aula.staff_id

                count += 1

            end

        end
        if count > max
            max = count
        end
        dados << count
        titulos << User.find(p.staff_id).nome + " (" + count.to_s + ")"
    end

    ::Gchart.bar(:title => TipoAula.find(taid).tipo, :size => '500x300', :bar_width_and_spacing => '50,50',
              :axis_with_labels => 'x,y', :data => dados, :axis_labels => [titulos,[0,max]] )

  end

  def self.numerosPorProfessorTotal(taid, gid, mes, ano)

    aulas = Aula.where(:ginasio_id => gid, :tipo_aula_id => taid)
    professores = aulas.select('distinct(staff_id)')

    titulos = []
    dados = []

    professores.each do |p|

        count = 0
        aulas.each do |a|
 
            if a.staff_id == p.staff_id

                count += 1
            end

        end
        dados << count
        titulos << User.find(p.staff_id).nome + " (" + count.to_s + ")"

    end

    ::Gchart.pie_3d(:title => TipoAula.find(taid).tipo, :size => '600x300', 
                    :bar_width_and_spacing => '50,50', :data => dados, :labels => titulos )

  end

  def self.totalGinasio(gid, ano)

    meses = ['Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro']
    titulos = []
    dados = []
    max = 0

    for i in 1..12
        count = 0
        ReservaAula.all.each do |r|

            if r.dia.month == i && r.dia.year == ano && r.dia <= Date.today && r.aula.ginasio_id == gid

                count += 1

            end

        end
        if count > max
            max = count
        end
        dados << count
        titulos << meses[i-1] + " (" + count.to_s + ")"
    end

    ::Gchart.line(:title => Ginasio.find(gid).nome, :size => '1000x300', 
                    :bar_width_and_spacing => '50,50', :data => dados, :labels => titulos )

  end


end

