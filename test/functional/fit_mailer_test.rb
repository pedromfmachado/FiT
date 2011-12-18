require 'test_helper'

class FitMailerTest < ActionMailer::TestCase
  tests FitMailer

  def setup
    @user = users(:david)
    @password = "cachodebaratas"
    @mail = FitMailer.welcome_email(@user, @password)
  end

  def teardown
    @user = nil
    @password = nil
    @mail = nil
  end

  test "welcome_email" do
    @expected.from    = 'FiT Staff <geral.fit@gmail.com>'
    @expected.to      = @user.email
    @expected.subject = "Bem vindo ao melhor ginasio de sempre!"
    @expected.body    = read_fixture('welcome_email')
    @expected.date    = @mail.date

    assert_equal @expected.from, @mail.from
    assert_equal @expected.to, @mail.to
    assert_equal @expected.subject, @mail.subject
    assert_equal @expected.body, @mail.body
    assert_equal @expected.date, @mail.date
  end
end
