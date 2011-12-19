require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    # working test
    @user1 = User.new(:email => "fluffy@example.com", :nome => "Josefina Allon", :password => "gaivota", :datanascimento => "2001-01-01",
        :telefone => "910555000", :ginasio_id => ginasios(:dragao).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade1).id)

    #same email, others are valid
    @user2 = User.new(:email => "fluffy@example.com", :nome => "Fail Allon", :password => "gaivota", :datanascimento => "2001-01-01",
        :telefone => "910555000", :ginasio_id => ginasios(:dragao).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade1).id)

    # fields missing
    @user3 = User.new(:email => "novo@example.com", :password => "crocodilo", :datanascimento => "1990-02-02",
        :ginasio_id => ginasios(:norteshopping).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade2).id)

    # doomed to fail
    @user4 = User.new(:email => "example@gmail.com", :password => "helloworld")

    # same email, wrong birthdate, wrong phone format
    @user5 = User.new(:email => "fluffy@example.com", :nome => "Fail Fail", :password => "kangurus", :datanascimento => "1995",
        :telefone => "9603388", :ginasio_id => ginasios(:braga).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade3).id)
  end

  def teardown
    @user1.destroy unless @user1.nil?
    @user2.destroy unless @user2.nil?
    @user3.destroy unless @user3.nil?
    @user4.destroy unless @user4.nil?
    @user5.destroy unless @user5.nil?
  end

  test "user create" do
    assert_equal "fluffy@example.com", @user1.email
    assert_equal "Josefina Allon", @user.nome
    assert_equal "2001-01-01", @user.datanascimento
    assert_equal "910555000", @user1.telefone
    assert_equal ginasios(:dragao).id, @user1.ginasio_id
    assert_equal modalidade_pagamentos(:modalidade1).id, @user1.modalidade_pagamento_id

    assert_equal "novo@example.com", :password




    assert_equal "fluffy@example.com", @user5.email
    assert_equal "Fail Fail", @user5.nome
    assert_equal "1995", @user5.datanascimento
    assert_equal "9603388", @user5.telefone
    assert_equal ginasios(:braga).id, @user5.ginasio_id
    assert_equal modalidade_pagamentos(:modalidade3).id, @user5.modalidade_pagamento_id
  end

  test "user save" do

  end

  # staff and admins, promotions and relegations
end
