require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    # working test
    @user1 = User.new(:email => "fluffy@example.com", :nome => "Josefina Allon", :password => "gaivota", :datanascimento => "2001-01-01",
        :morada => "Av. da Boavista, PORTO", :telefone => "910555000",
        :ginasio_id => ginasios(:dragao).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade1).id)

    #same email
    @user2 = User.new(:email => "fluffy@example.com", :nome => "Fail Allon", :password => "gaivota", :datanascimento => "2001-01-01",
        :morada => "Rua 14 de Agosto, PORTO", :telefone => "910555011",
        :ginasio_id => ginasios(:dragao).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade1).id)

    # fields missing, doomed to fail
    @user3 = User.new(:email => "example@gmail.com", :password => "helloworld")

    # same email, wrong birthdate, wrong phone format, no address
    @user4 = User.new(:email => "fluffy@example.com", :nome => "Fail Fail", :password => "kangurus", :datanascimento => "1995",
        :telefone => "9603388", :ginasio_id => ginasios(:braga).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade3).id)

    # used only in the staff/admin tests
    @user_to_staff = User.new(:email => "staff_test@case.com", :nome => "Mr Sony", :password => "caogrande", :datanascimento => "1999-12-31",
        :morada => "Rua 14 de Agosto, 4200 PORTO", :telefone => "969111000",
        :ginasio_id => ginasios(:braga).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade1).id)

    @user_to_admin = User.new(:email => "admin_test@case.com", :nome => "Parappa The Rapper", :password => "toiletcheck", :datanascimento => "1997-05-01",
        :morada => "Rua Costa Cabral, PORTO", :telefone => "210555000",
        :ginasio_id => ginasios(:braga).id, :modalidade_pagamento_id => modalidade_pagamentos(:modalidade1).id)
  end

  def teardown
    @user1.destroy unless @user1.nil?
    @user2.destroy unless @user2.nil?
    @user3.destroy unless @user3.nil?
    @user4.destroy unless @user4.nil?
    @user_to_staff.destroy unless @user_to_staff.nil?
    @user_to_admin.destroy unless @user_to_admin.nil?
  end

  test "user create" do
    assert_equal "fluffy@example.com", @user1.email
    assert_equal "Josefina Allon", @user1.nome
    assert_equal "2001-01-01", @user1.datanascimento
    assert_equal "Av. da Boavista, PORTO", @user1.morada
    assert_equal "910555000", @user1.telefone
    assert_equal ginasios(:dragao).id, @user1.ginasio_id
    assert_equal modalidade_pagamentos(:modalidade1).id, @user1.modalidade_pagamento_id

    assert_equal "fluffy@example.com", @user2.email
    assert_equal "Fail Allon", @user2.nome
    assert_equal "2001-01-01", @user2.datanascimento
    assert_equal "Rua 14 de Agosto, PORTO", @user2.morada
    assert_equal "910555011", @user2.telefone
    assert_equal ginasios(:dragao).id, @user2.ginasio_id
    assert_equal modalidade_pagamentos(:modalidade1).id, @user2.modalidade_pagamento_id

    assert_equal "example@gmail.com", @user3.email
    assert @user3.nome.blank?
    assert @user3.datanascimento.blank?
    assert @user3.telefone.blank?
    assert @user3.ginasio_id.blank?
    assert @user3.modalidade_pagamento_id.blank?

    assert_equal "fluffy@example.com", @user4.email
    assert_equal "Fail Fail", @user4.nome
    assert_equal "1995", @user4.datanascimento
    assert_equal "9603388", @user4.telefone
    assert_equal ginasios(:braga).id, @user4.ginasio_id
    assert_equal modalidade_pagamentos(:modalidade3).id, @user4.modalidade_pagamento_id
  end

  test "user save" do
    assert @user1.save
    assert !@user2.save

    @user2.email = "emaildiferente@gmail.com"
    assert @user2.save

    assert !@user3.save
    assert !@user4.save
  end

  # staff and admins, promotions and relegations
  test "user staff and admin" do
    assert @user_to_staff.save
    assert @user_to_admin.save

    assert @user_to_staff.normal?
    @user_to_staff.promote
    assert (@user_to_staff.staff? && !@user_to_staff.admin? && !@user_to_staff.normal?)
    @user_to_staff.demote
    assert @user_to_staff.normal?

    @user_to_admin.promote
    @user_to_admin.promote
    assert (@user_to_admin.admin? && !@user_to_admin.staff? && !@user_to_admin.normal?)
    @user_to_admin.demote
    assert @user_to_admin.staff?
    @user_to_admin.demote
    assert @user_to_admin.normal?
  end
end

