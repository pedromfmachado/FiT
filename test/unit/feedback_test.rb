require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @feedback1 = Feedback.new(:aula_id => aulas(:aula1).id, :valor => 3, :user_id => users(:andre_alves).id)
    @feedback2 = Feedback.new(:aula_id => aulas(:aula1).id, :valor => 5)
    @feedback3 = Feedback.new(:valor => 3, :user_id => users(:andre_alves).id)
    @feedback4 = Feedback.new(:aula_id => aulas(:aula1).id, :valor => 30)
    @feedback5 = Feedback.new(:aula_id => aulas(:aula1).id, :valor => 1, :user_id => users(:andre_alves).id) #tentar criar dois feedbacks iguais e da segunda vez falha
  end

  def teardown
    @feedback1.destroy unless @feedback1.nil?
    @feedback2.destroy unless @feedback2.nil?
    @feedback3.destroy unless @feedback3.nil?
    @feedback4.destroy unless @feedback2.nil?
    @feedback5.destroy unless @feedback3.nil?
  end

  test "Feedback create" do
     assert_equal aulas(:aula1).id, @feedback1.aula_id
     assert_equal 3, @feedback1.valor
     assert_equal users(:andre_alves).id, @feedback1.user_id

     assert_equal aulas(:aula1).id, @feedback2.aula_id
     assert_equal 5, @feedback2.valor
     assert @feedback2.user_id.blank?

     assert @feedback3.aula_id.blank?
     assert_equal 3, @feedback3.valor
     assert_equal users(:andre_alves).id, @feedback3.user_id

     assert_equal aulas(:aula1).id, @feedback4.aula_id
     assert_equal 30, @feedback4.valor
     assert @feedback4.user_id.blank?

     assert_equal aulas(:aula1).id, @feedback5.aula_id
     assert_equal 1, @feedback5.valor
     assert_equal users(:andre_alves).id, @feedback5.user_id

  end

  test "Feedback save" do
      assert @feedback1.save
      assert !@feedback2.save
      assert !@feedback3.save
      assert !@feedback4.save
      assert !@feedback5.save

  end
end
