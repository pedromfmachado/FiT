require 'test_helper'

class AulaTest < ActiveSupport::TestCase

  def setup
    # correctly formed
    @aula1 = Aula.new(:staff_id => users(:valter).id, :ginasio_id => ginasios(:dragao), :estudio_id => estudios(:estudio_0).id,
      :tipo_aula_id => tipo_aulas(:hiphop).id, :dia => 0, :inicio => "17:00", :duracao => 80 )

    # bad format
    @aula2 = Aula.new(:staff_id => users(:goncalo).id, :ginasio_id => ginasios(:dragao), :estudio_id => estudios(:estudio_1).id,
      :tipo_aula_id => tipo_aulas(:pilates).id, :dia => 2, :inicio => "25:00", :duracao => 30 )

    @aula3 = Aula.new(:staff_id => users(:valter).id, :ginasio_id => ginasios(:dragao), :estudio_id => estudios(:estudio_1).id,
      :tipo_aula_id => tipo_aulas(:pilates).id, :dia => 2, :inicio => "2:00", :duracao => 790 )

    # missing parameters
    @aula4 = Aula.new(:staff_id => users(:goncalo).id)

    # custom methods check?
  end

  def teardown
    @aula1.destroy
    @aula2 = nil
    @aula4 = nil
  end

#  test "aula create" do
#    assert true
#  end

  test "aula save" do
    assert @aula1.save!
    assert !@aula2.save
    assert !@aula3.save
    assert !@aula4.save
  end

end

