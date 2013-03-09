Kko::Application.routes.draw do

 root to: 'languages#index'

 resources :categories
 resources :languages do
  resources :flashcards do
   resources :vocabularies
   resources :logs do
    resources :lognotes
   end
  end
 end
  
end
