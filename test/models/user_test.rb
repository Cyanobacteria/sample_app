require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  

  def setup
    @user = User.new(name: "i", email: "user@example.com", password: "sacsac", password_confirmation: "sacsac")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end 
  
  test "email should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example,com USER_AT_foo.COM A_US-ER_AT_foo.bar.org first.last_AT_foo.jp alice+bob_AT_baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
 # test "the email be saved that should be downcase"
 #   mmce = "FOO@EXample.com"
 #   @user.email = mmce    
 #   @user.save
 #   assert_equal mmce.downcase, @user.reload.email
 # end 




end
