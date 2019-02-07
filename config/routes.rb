Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lines do
    resources :line_numbers,only: [:create,:destroy]
    resources :line_memories,only: [:create,:destroy]
    resources :line_show
  end

  resources :bars do
    resources :bar_numbers,only: [:create,:destroy]
    resources :memories,only: [:create,:destroy]
    resources :bar_show
  end

  resources :scatters do
    resources :scat_numbers,only: [:create,:destroy]
    resources :scata_numbers,only: [:create,:destroy]
    resources :scatter_show
  end
end
