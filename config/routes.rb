Rails.application.routes.draw do
	post 'api/v1/signup', to: 'devise/registrations#new'
	namespace :api do
	    namespace :v1 do
	      resources :books
	    end
	end
end
