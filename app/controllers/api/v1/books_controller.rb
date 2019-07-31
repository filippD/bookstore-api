
module Api::V1
	class BooksController < ApplicationController
		before_action :authenticate_user
		before_action :set_book, only: [:show, :update, :destroy]

		def index
			@books = current_user.books.order(:created_at)
			render json: @books
		end

		def show
	      render json: @book
	    end

	    def create
	    	@book = current_user.books.build(book_params)
	    	@book.read = false
			if @book.save
				render json: @book, status: :created
			else
				render json: @book.errors, status: :unprocessable_entity
			end
	    end 

	    def update
	      if @book.update(book_params)
	        head :no_content, status: :ok
	      else
	        render json: @book.errors, status: :unprocessable_entity
	      end
	    end

	    def destroy
	      @book.destroy
	      if @book.destroy
	        head :no_content, status: :ok
	      else
	        render json: @book.errors, status: :unprocessable_entity
	      end      
	    end

	    private

	    def set_book
        	@book = Book.find(params[:id])
      	end

      	def book_params
			params.permit(:title, :category, :read)
		end
	end
end  
