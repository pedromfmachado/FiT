require 'test_helper'

class ExercicioTest < ActiveSupport::TestCase

  def setup
    @exercicio1 = Exercicio.new(:nome => "Levanta Pesos", :maquina => "Pesos", :tipo => "Musculacao")
    @exercicio2 = Exercicio.new(:nome => "Empurra Caixas", :maquina => "Caixas")
    @exercicio3 = Exercicio.new(:nome => "Ginastica", :tipo => "Nao sei")
    @exercicio4 = Exercicio.new(:nome => "Nada")
  end

  def teardown
    @exercicio1.destroy unless @exercicio1.nil?
    @exercicio2.destroy unless @exercicio2.nil?
    @exercicio3.destroy unless @exercicio3.nil?
    @exercicio4.destroy unless @exercicio4.nil?
  end

  test "exercicio create" do
    assert_equal "Levanta Pesos", @exercicio1.nome
    assert_equal "Pesos", @exercicio1.maquina
    assert_equal "Musculacao", @exercicio1.tipo

    assert_equal "Empurra Caixas", @exercicio2.nome
    assert_equal "Caixas", @exercicio2.maquina
    assert @exercicio2.tipo.blank?

    assert_equal "Ginastica", @exercicio3.nome
    assert_equal "Nao sei", @exercicio3.tipo
    assert @exercicio3.maquina.blank?

    assert_equal "Nada", @exercicio4.nome
    assert @exercicio4.maquina.blank?
    assert @exercicio4.tipo.blank?
  end

  test "exercicio save" do
    assert @exercicio1.save
    assert !@exercicio2.save # one (or more) parameters missing.
    assert !@exercicio3.save
    assert !@exercicio4.save
  end

end

