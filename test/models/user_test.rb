require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "John Doe", email: "johndoe@gmail.com",
      password:"sample_password", password_confirmation: "sample_password",
      employee_id:"CHR/151")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 250 + "@example.com"
    assert_not @user.valid?
  end

  test "accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |oneAddress|
      @user.email = oneAddress
      assert @user.valid?
    end
  end

  test "reject invalid email addresses" do
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
    valid_addresses.each do |oneAddress|
      @user.email = oneAddress
      assert_not @user.valid?
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be converted to lower case" do
    sample_email = "abCD@Gmail.com"
    @user.email = sample_email
    @user.save
    assert sample_email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation =   " " * 10
    assert_not @user.valid?
  end

  test "password should have minimum length" do
    @user.email = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "employee id should be present" do
    @user.employee_id = " " * 10
    assert_not @user.valid?
  end

  test "employee id should have minimum length" do
    @user.email = "a" * 4
    assert_not @user.valid?
  end
end
