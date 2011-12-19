require 'test_helper'

class ReservaAulaTest < ActiveSupport::TestCase

  def setup
    @days_ago = Time.now - 7.day
    @reserva1 = ReservaAula.new(:aula_id => aulas(:aula2).id, :user_id => users(:andre_alves).id, :dia => @days_ago)
    @reserva2 = ReservaAula.new(:aula_id => aulas(:aula1).id, :user_id => users(:andre_marinho).id)
    @reserva3 = ReservaAula.new(:aula_id => aulas(:aula2).id)

    # teste de lotacao
    @reserva4 = ReservaAula.new(:aula_id => aulas(:aula2).id, :user_id => users(:andre_marinho).id, :dia => @days_ago)

    @reserva5 = ReservaAula.new
  end

  def teardown
    @reserva1.destroy
  end

  test "reserva aula create" do
     assert_equal aulas(:aula2).id, @reserva1.aula_id
     assert_equal users(:andre_alves).id, @reserva1.user_id
     assert_equal @days_ago, @reserva1.dia

     assert_equal aulas(:aula1).id, @reserva2.aula_id
     assert_equal users(:andre_marinho).id, @reserva2.user_id
     assert @reserva2.dia.blank?

     assert_equal aulas(:aula2).id, @reserva3.aula_id
     assert @reserva3.user_id.blank?
     assert @reserva3.dia.blank?

     assert_equal aulas(:aula2).id, @reserva4.aula_id
     assert_equal users(:andre_marinho).id, @reserva4.user_id
     assert_equal @days_ago, @reserva4.dia

     assert @reserva5.aula_id.blank?
     assert @reserva5.user_id.blank?
     assert @reserva5.dia.blank?
  end

  test "reserva aula save" do
    assert @reserva1.save!
    assert !@reserva2.save
    assert !@reserva3.save
    assert !@reserva4.save
    assert !@reserva5.save
  end

end

