class Book < ApplicationRecord
	validates_presence_of :title, :category
	belongs_to :user
	default_scope {order('created_at DESC')}
end
