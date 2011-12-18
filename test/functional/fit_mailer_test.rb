require 'test_helper'

class FitMailerTest < ActionMailer::TestCase
  tests FitMailer

  def setup
    @time = Time.now
    @user = users(:david)
    @password = "cachodebaratas"
    @mail = FitMailer.welcome_email(@user, @password, @time)
  end

  def teardown
    @time = nil
    @user = nil
    @password = nil
    @mail = nil
  end

  test "welcome_email" do
    @expected.from       = 'FiT Staff <geral.fit@gmail.com>'
    @expected.to         = @user.email
    @expected.subject    = "Bem vindo ao melhor ginasio de sempre!"
    @expected.body       = read_fixture('welcome_email')
    @expected.date       = @time
    @expected.message_id = "#{Digest::SHA2.hexdigest(@time.to_i.to_s)}@fitec.com"
    @expected.content_type = "text/html; charset=UTF-8"
    

    assert_equal @expected.from, @mail.from
    assert_equal @expected.to, @mail.to
    assert_equal @expected.subject, @mail.subject
    assert_equal @expected.body.raw_source, @mail.body.raw_source
    assert_equal @expected.date, @mail.date
    assert_equal @expected.message_id, @mail.message_id
    assert_equal @expected.content_type, @mail.content_type

    assert_equal @expected.encoded, @mail.encoded
  end
end
