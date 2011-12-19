require 'test_helper'

class EstudioTest < ActiveSupport::TestCase
  def setup
    @estudio = Estudio.new(:nome => "Estudio Fixe", :lotacao => 150, :ginasio_id => ginasios(:dragao).id)
  end

  def teardown
    @estudio.destroy unless @estudio.nil?
  end

  test "estudio create" do
    assert_equal "Estudio Fixe", @estudio.nome
    assert_equal 150, @estudio.lotacao
    assert_equal ginasios(:dragao).id, @estudio.ginasio_id
  end

  test "estudio save" do
     size = Estudio.all.size
     assert @estudio.save
     assert_equal size+1, Estudio.all.size
     assert Estudio.find(@estudio.id)
  end

  test "estudio destroy" do
    @estudio.save
    size = Estudio.all.size
    id = @estudio.id

    @estudio.destroy
    assert_equal size-1, Estudio.all.size
    assert_raise(ActiveRecord::RecordNotFound) { Estudio.find(id) }
  end
end
