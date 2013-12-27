ItsarWeb::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :user
  #resources :itsar_group

  #LOGIN ROUTES
  match '/sign_in/' => 'login#signin'
  match '/sign_out/' => 'login#signout'

  #USER ROUTES
  match '/pengguna/cek' => 'user#callback_username'
  match '/user/:id/update_user' => 'user#update_user'
  match '/:id/delete_user' => 'user#delete_user'
  match '/search_itsargroup' => 'user#search'
  match '/:id/edit_user' => 'user#edit_user'


  #ITSARGROUP ROUTES
  match '/:id/edit_itsargroup' => 'itsar_group#edit_itsargroup'
  match '/itsar_group/:id/update_itsar_group' => 'itsar_group#update_itsargroup'
  match '/:id/delete_itsargroup' => 'itsar_group#delete_itsar_group'
  match '/search_itsargroup' => 'itsar_group#search'

  # USERTYPE ROUTES
  match '/:id/edit_usertype' => 'usertype#edit_usertype'
  match '/usertype/:id/update_usertype' => 'usertype#update_usertype'
  match '/:id/delete_usertype' => 'usertype#delete_usertype'
  match '/search_usertype' => 'usertype#search'

  

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'login#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
