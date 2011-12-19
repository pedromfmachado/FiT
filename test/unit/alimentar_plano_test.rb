require 'test_helper'

class AlimentarPlanoTest < ActiveSupport::TestCase
  def setup
    @plano1 = AlimentarPlano.new(:data => Time.now, :pequenoalmoco => "Copo de leite", :manha => "Fruta",
        :almoco => "Sardinhas", :tarde => "Fruta", :jantar => "Bacalhau", :ceia => "3 bolachas", :user_id => users(:andre_alves).id)

    @plano2 = AlimentarPlano.new(:data => Time.now, :manha => "Fruta", :almoco => "Sardinhas", :tarde => "Fruta",
        :jantar => "Bacalhau", :ceia => "3 bolachas", :user_id => users(:andre_alves).id)

    @plano3 = AlimentarPlano.new(:data => Time.now, :pequenoalmoco => "Copo de leite", :almoco => "Sardinhas",
        :tarde => "Fruta", :jantar => "Bacalhau", :ceia => "3 bolachas", :user_id => users(:andre_alves).id)

    @plano4 = AlimentarPlano.new(:data => Time.now, :pequenoalmoco => "Copo de leite", :manha => "Fruta",
        :tarde => "Fruta", :jantar => "Bacalhau", :ceia => "3 bolachas", :user_id => users(:andre_alves).id)

    @plano5 = AlimentarPlano.new(:data => Time.now, :pequenoalmoco => "Copo de leite", :manha => "Fruta",
        :almoco => "Sardinhas", :jantar => "Bacalhau", :ceia => "3 bolachas", :user_id => users(:andre_alves).id)

    @plano6 = AlimentarPlano.new(:data => Time.now, :pequenoalmoco => "Copo de leite", :manha => "Fruta",
        :almoco => "Sardinhas", :tarde => "Fruta", :ceia => "3 bolachas", :user_id => users(:andre_alves).id)

    @plano7 = AlimentarPlano.new(:data => Time.now, :pequenoalmoco => "Copo de leite", :manha => "Fruta",
        :almoco => "Sardinhas", :tarde => "Fruta", :jantar => "Bacalhau", :user_id => users(:andre_alves).id)

    @plano8 = AlimentarPlano.new(:data => Time.now, :pequenoalmoco => "Copo de leite", :manha => "Fruta",
        :almoco => "Sardinhas", :tarde => "Fruta", :jantar => "Bacalhau", :ceia => "3 bolachas")
  end

  def teardown
    @plano1.destroy unless @plano1.nil?
    @plano2.destroy unless @plano1.nil?
    @plano3.destroy unless @plano1.nil?
    @plano4.destroy unless @plano1.nil?
    @plano5.destroy unless @plano1.nil?
    @plano6.destroy unless @plano1.nil?
    @plano7.destroy unless @plano1.nil?
    @plano8.destroy unless @plano1.nil?
  end

  test "alimentar plano create" do
    assert_equal "Copo de leite", @plano1.pequenoalmoco
    assert_equal "Fruta", @plano1.manha
    assert_equal "Sardinhas", @plano1.almoco
    assert_equal "Fruta", @plano1.tarde
    assert_equal "Bacalhau", @plano1.jantar
    assert_equal "3 bolachas", @plano1.ceia

    assert @plano2.pequenoalmoco.blank?
    assert_equal "Fruta", @plano2.manha
    assert_equal "Sardinhas", @plano2.almoco
    assert_equal "Fruta", @plano2.tarde
    assert_equal "Bacalhau", @plano2.jantar
    assert_equal "3 bolachas", @plano2.ceia

    assert_equal "Copo de leite", @plano3.pequenoalmoco
    assert @plano3.manha.blank?
    assert_equal "Sardinhas", @plano3.almoco
    assert_equal "Fruta", @plano3.tarde
    assert_equal "Bacalhau", @plano3.jantar
    assert_equal "3 bolachas", @plano3.ceia

    assert_equal "Copo de leite", @plano4.pequenoalmoco
    assert_equal "Fruta", @plano4.manha
    assert @plano4.almoco.blank?
    assert_equal "Fruta", @plano4.tarde
    assert_equal "Bacalhau", @plano4.jantar
    assert_equal "3 bolachas", @plano4.ceia

    assert_equal "Copo de leite", @plano5.pequenoalmoco
    assert_equal "Fruta", @plano5.manha
    assert_equal "Sardinhas", @plano5.almoco
    assert @plano5.tarde.blank?
    assert_equal "Bacalhau", @plano5.jantar
    assert_equal "3 bolachas", @plano5.ceia

    assert_equal "Copo de leite", @plano6.pequenoalmoco
    assert_equal "Fruta", @plano6.manha
    assert_equal "Sardinhas", @plano6.almoco
    assert_equal "Fruta", @plano6.tarde
    assert @plano6.jantar.blank?
    assert_equal "3 bolachas", @plano6.ceia

    assert_equal "Copo de leite", @plano7.pequenoalmoco
    assert_equal "Fruta", @plano7.manha
    assert_equal "Sardinhas", @plano7.almoco
    assert_equal "Fruta", @plano7.tarde
    assert_equal "Bacalhau", @plano7.jantar
    assert @plano7.ceia.blank?

    assert_equal "Copo de leite", @plano8.pequenoalmoco
    assert_equal "Fruta", @plano8.manha
    assert_equal "Sardinhas", @plano8.almoco
    assert_equal "Fruta", @plano8.tarde
    assert_equal "Bacalhau", @plano8.jantar
    assert_equal "3 bolachas", @plano8.ceia
    assert @plano8.user_id.blank?
  end

  test "alimentar plano save" do
    assert @plano1.save
    assert !@plano2.save
    assert !@plano3.save
    assert !@plano4.save
    assert !@plano5.save
    assert !@plano6.save
    assert !@plano7.save
    assert !@plano8.save
  end
end

