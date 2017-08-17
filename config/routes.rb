Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'livraria/livro/:codigo', to: 'livrarias#show'
  root "livrarias#index"
end
