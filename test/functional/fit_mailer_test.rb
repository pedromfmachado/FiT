require 'test_helper'

class FitMailerTest < ActionMailer::TestCase
  tests FitMailer

  def setup
    @user = users(:david)
    @password = "cachodebaratas"
  end

  def teardown
    @user = nil
  end

  test "welcome_email" do
    @expected.from    = 'FiT Staff <geral.fit@gmail.com>'
    @expected.to      = @user.email
    @expected.subject = "Bem vindo ao melhor ginasio de sempre!"
    @expected.body    = read_fixture('welcome_email')
    @expected.date    = Time.now
 
    assert_equal @expected.body, FitMailer.welcome_email(@user, @password).body
  end
end
