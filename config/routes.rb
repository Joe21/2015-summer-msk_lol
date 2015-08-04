Rails.application.routes.draw do
  root 'games#index'

  # resources :champs
  get 'play' => 'games#play'
  patch 'play/update' => 'champs#update', as: 'champ_update'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

# Rake routes

#         root GET   /                                  games#index
#         play GET   /play(.:format)                    games#play
# champ_update PATCH /play/update(.:format)             champs#update
#              GET   /auth/:provider/callback(.:format) sessions#create
# auth_failure GET   /auth/failure(.:format)            redirect(301, /)
#      signout GET   /signout(.:format)                 sessions#destroy




#       Prefix Verb   URI Pattern                        Controller#Action
#         root GET    /                                  games#index
#       champs GET    /champs(.:format)                  champs#index
#              POST   /champs(.:format)                  champs#create
#    new_champ GET    /champs/new(.:format)              champs#new
#   edit_champ GET    /champs/:id/edit(.:format)         champs#edit
#        champ GET    /champs/:id(.:format)              champs#show
#              PATCH  /champs/:id(.:format)              champs#update
#              PUT    /champs/:id(.:format)              champs#update
#              DELETE /champs/:id(.:format)              champs#destroy
#         play GET    /play(.:format)                    games#play
#              GET    /auth/:provider/callback(.:format) sessions#create
# auth_failure GET    /auth/failure(.:format)            redirect(301, /)
#      signout GET    /signout(.:format)                 sessions#destroy






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
