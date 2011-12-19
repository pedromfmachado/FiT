require 'test_helper'

class GinasioTest < ActiveSupport::TestCase
  def setup
    @ginasio1 = Ginasio.new(:nome => "Solinca FEUP", :morada => "Rua Dr. Roberto Frias, PORTO", :telefone => "911333555")
    @ginasio2 = Ginasio.new(:nome => "Outro Ginasio", :morada => "Rua Jorge de Sena, Rio Tinto, PORTO")
    @ginasio3 = Ginasio.new(:nome => "Ultimo")
    @ginasio4 = Ginasio.new(:nome => "Nao sou eu", :morada => "Av. da Boavista, PORTO", :telefone => "+321966966966")
  end

  def teardown
    @ginasio1.destroy unless @ginasio1.nil?
    @ginasio2.destroy unless @ginasio2.nil?
    @ginasio3.destroy unless @ginasio3.nil?
    @ginasio4.destroy unless @ginasio4.nil?
  end

  test "ginasio create" do
     assert_equal "Solinca FEUP", @ginasio1.nome
     assert_equal "Rua Dr. Roberto Frias, PORTO", @ginasio1.morada
     assert_equal "911333555", @ginasio1.telefone
     assert @ginasio1.latitude.blank?
     assert @ginasio1.longitude.blank?

     assert_equal "Outro Ginasio", @ginasio2.nome
     assert_equal "Rua Jorge de Sena, Rio Tinto, PORTO", @ginasio2.morada
     assert @ginasio2.latitude.blank?
     assert @ginasio2.longitude.blank?
     assert @ginasio2.telefone.blank?

     assert_equal "Ultimo", @ginasio3.nome
     assert @ginasio3.morada.blank?
     assert @ginasio3.telefone.blank?
     assert @ginasio3.latitude.blank?
     assert @ginasio3.longitude.blank?

     assert_equal "Nao sou eu", @ginasio4.nome
     assert_equal "Av. da Boavista, PORTO", @ginasio4.morada
     assert_equal "+321966966966", @ginasio4.telefone
  end

  # also tests if geocoded correctly
  test "ginasio save with geocoder" do
     assert @ginasio1.save
     assert_equal 41.1803776, @ginasio1.latitude
     assert_equal -8.5971475, @ginasio1.longitude

     assert !@ginasio2.save # no phone
     @ginasio2.telefone = "225777999"

     assert @ginasio2.save
     assert_equal 41.1905463, @ginasio2.latitude
     assert_equal -8.5776167, @ginasio2.longitude

     assert !@ginasio3.save # no address, no phone

     assert !@ginasio4.save # phone number is incorrect
  end


  test "ginasio pertocidade" do
    city = cidades(:porto_cidade)

    # search in a 10km radius
    ginasios = Ginasio.near([city.latitude, city.longitude], "3".to_f * 0.62).map(&:nome)
#dragao, gaia, norteshopping, portopalacio

    assert_equal "", ginasios
  end
end

