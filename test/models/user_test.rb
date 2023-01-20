require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "testex@test.cz", 
                     password: "abcd1234", 
                     name: "John",
                     last_name: "Donne",
                     dob:"17/11/1997",
                     country: "de",
                    )
  end

  test "Name can't be longer than 50 chars" do
    @user.name = 'a'*51
    assert_not @user.valid?
  end

  test "name should exist" do
    @user.name = '    '
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM a_US-ER@foo.bar.org first.last@foo.js alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should not accept invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_biz.com foo@bar+baz.com]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should not be valid"
    end
  end

  test "email must be present" do
    @user.email = '   '
    assert_not @user.valid?
  end

  test "date of birth should be in the past" do
    @user.dob = '18-02-2300'
    assert_not @user.valid?
  end

  test "date of birth should not be in the nineteenth century" do
    @user.dob = '31-12-1899'
    assert_not @user.valid?
  end

  test "country should be one of the given" do
    invalid_countries = ['ko', 'rus', 'EN']
    invalid_countries.each do |country|
      @user.country = country
      assert_not @user.valid?, "#{country} should not be valid"
    end
  end
end
