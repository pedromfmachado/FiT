require 'test_helper'

class ExerciciosPlanosTest < ActiveSupport::TestCase

  def setup
    @exercicio1 = ExerciciosPlanos.new(:peso => 75, :series => 15, :repeticoes => 15, :plano_id => planos(:plano1).id, :exercicio_id => exercicios(:exercicio2).id)
    @exercicio2 = ExerciciosPlanos.new(:series => 15, :repeticoes => 15, :plano_id => planos(:plano1).id, :exercicio_id => exercicios(:exercicio2).id)
    @exercicio3 = ExerciciosPlanos.new(:peso => 75, :repeticoes => 15, :plano_id => planos(:plano1).id, :exercicio_id => exercicios(:exercicio2).id)
    @exercicio4 = ExerciciosPlanos.new(:peso => 75, :series => 15, :repeticoes => 15, :exercicio_id => exercicios(:exercicio2).id)
    @exercicio5 = ExerciciosPlanos.new(:peso => 75, :series => 15, :repeticoes => 15, :plano_id => planos(:plano1).id)
    @exercicio6 = ExerciciosPlanos.new(:peso => 75, :series => 15, :plano_id => planos(:plano1).id, :exercicio_id => exercicios(:exercicio2).id)
  end

  def teardown
    ExerciciosPlanos.where(:plano_id => planos(:plano1).id).where(:exercicio_id => exercicios(:exercicio2).id).delete_all unless @exercicio1.nil?

    # test samples 2..5 will fail on insertion, no need to remove them

    ExerciciosPlanos.where(:plano_id => planos(:plano1).id).where(:exercicio_id => exercicios(:exercicio2).id).delete_all unless @exercicio6.nil?
  end

  test "exercicios planos create" do
    assert_equal 75, @exercicio1.peso
    assert_equal 15, @exercicio1.series
    assert_equal 15, @exercicio1.repeticoes
    assert !@exercicio1.plano_id.blank?
    assert !@exercicio1.exercicio_id.blank?

    assert @exercicio2.peso.blank?
    assert_equal 15, @exercicio2.series
    assert_equal 15, @exercicio2.repeticoes
    assert !@exercicio2.plano_id.blank?
    assert !@exercicio2.exercicio_id.blank?

    assert_equal 75, @exercicio3.peso
    assert @exercicio3.series.blank?
    assert_equal 15, @exercicio3.repeticoes
    assert !@exercicio3.plano_id.blank?
    assert !@exercicio3.exercicio_id.blank?

    assert_equal 75, @exercicio4.peso
    assert_equal 15, @exercicio4.series
    assert_equal 15, @exercicio4.repeticoes
    assert @exercicio4.plano_id.blank?
    assert !@exercicio4.exercicio_id.blank?

    assert_equal 75, @exercicio5.peso
    assert_equal 15, @exercicio5.series
    assert_equal 15, @exercicio5.repeticoes
    assert !@exercicio5.plano_id.blank?
    assert @exercicio5.exercicio_id.blank?

    assert_equal 75, @exercicio6.peso
    assert_equal 15, @exercicio6.series
    assert @exercicio6.repeticoes.blank?
    assert !@exercicio6.plano_id.blank?
    assert !@exercicio6.exercicio_id.blank?
  end

  test "exercicios planos save" do
    assert @exercicio1.save
    assert !@exercicio2.save
    assert !@exercicio3.save
    assert !@exercicio4.save
    assert !@exercicio5.save
    assert !@exercicio6.save
  end

end

