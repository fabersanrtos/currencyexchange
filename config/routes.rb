Rails.application.routes.draw do
#  get 'home/index'

#  get 'home/exchange'

  root 'home#index'
  post 'exchange', to: 'home#exchange'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
