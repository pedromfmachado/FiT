require 'test_helper'

class PlanoTest < ActiveSupport::TestCase
  	def setup
		@plano1 = Plano.new(:altura=>180, :peso=>80, :user_id=>users(:andre_alves).id, :admin_id=> Admin.find_by_user_id(users(:pedro).id).id, :data=> Time.now)
		@plano2 = Plano.new(:peso=>80, :user_id=>users(:andre_alves).id, :admin_id=> Admin.find_by_user_id(users(:pedro).id).id, :data=> Time.now)
		@plano3 = Plano.new(:altura=>180, :user_id=>users(:andre_alves).id, :admin_id=> Admin.find_by_user_id(users(:pedro).id).id, :data=> Time.now)
		@plano4 = Plano.new(:altura=>180, :peso=>80, :user_id=>users(:andre_alves).id, :admin_id=> Admin.find_by_user_id(users(:pedro).id).id)
	end

	def teardown
		@plano1.destroy unless @plano1.nil?
		@plano2.destroy unless @plano2.nil?
		@plano3.destroy unless @plano3.nil?
		@plano4.destroy unless @plano4.nil?
	end

	test "Plano create" do
		assert_equal 180, @plano1.altura
		assert_equal 80, @plano1.peso
		assert !@plano1.user_id.blank?
		assert !@plano1.admin_id.blank?
		assert !@plano1.data.blank?

		assert @plano2.altura.blank?
		assert_equal 80, @plano2.peso
		assert !@plano2.user_id.blank?
		assert !@plano2.admin_id.blank?
		assert !@plano2.data.blank?

		assert_equal 180, @plano3.altura
		assert @plano3.peso.blank?
		assert !@plano3.user_id.blank?
		assert !@plano3.admin_id.blank?
		assert !@plano3.data.blank?

		assert_equal 180, @plano4.altura
		assert_equal 80, @plano4.peso
		assert !@plano4.user_id.blank?
		assert !@plano4.admin_id.blank?
		assert @plano4.data.blank?

	end

	test "Plano save" do
		assert @plano1.save
		assert !@plano2.save
		assert !@plano3.save
		assert !@plano4.save
	end
end
