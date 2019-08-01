require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(username: 'John', email: 'john@example.com', password: 'secret', password_confirmation: 'secret')
  end

  test 'valid user' do
  	@user.save!
    assert @user.valid?
  end

  test 'invalid without username' do
  	@user.username = nil 
    refute @user.valid?, 'user is valid without a name'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
  	@user.email = nil
    refute @user.valid?, 'user is valid without a category'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end

  test 'invalid without password' do
  	@user.password = nil
    refute @user.valid?, 'user is valid without a category'
    assert_not_nil @user.errors[:password], 'no validation error for password present'
  end

  test 'invalid when passwords do not match' do
  	@user.password_confirmation = "different"
    refute @user.valid?, 'user is valid without a matching passwords'
  end

  test 'can create posts' do
  	@user.save
  	assert_difference('@user.books.count', 1) do
	    @user.books.create(title: 'Book', category: 'Action', read: false)
	end
  end

end
