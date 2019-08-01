require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(username: 'John', email: 'john@example.com')
  	@book = Book.new(title: 'Book', category: 'Action', read: false, user: @user)
  end

  test 'valid book' do
    assert @book.valid?
  end

  test 'invalid without title' do
  	@book.title = nil 
    refute @book.valid?, 'book is valid without a title'
    assert_not_nil @book.errors[:title], 'no validation error for title present'
  end

  test 'invalid without category' do
  	@book.category = nil
    refute @book.valid?, 'book is valid without a category'
    assert_not_nil @book.errors[:category], 'no validation error for category present'
  end

  test 'belongs to a user' do
  	assert @book.user == @user
  end

end
