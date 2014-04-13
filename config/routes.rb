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
  # resources :user

  #HOME ROUTES
  match '/home/public/' => 'home#index'
  match '/admin_home/' => 'home_admin#index'
 
  #MENU ROUTES
  match '/menu_cfg/' => 'menu#index'
  match '/:id/edit_menu' => 'menu#edit_menu'
  match '/:id/delete_menu' => 'menu#delete_menu'
  match '/menu/:id/update_menu' => 'menu#update_menu'

  #SUB MENU ROUTES
  match '/:id/add-sub-menu/' => 'sub_menu#index'
  match '/:id/:idsub/edit-sub-menu/' => 'sub_menu#edit_sub'
  match '/:id/:idsub/delete-sub-menu/' => 'sub_menu#delete_sub'
  match '/sub_menu/:id/:idsub/update_submenu' => 'sub_menu#update_submenu'
  match '/sub_menu/:id/search_submenu/' => 'sub_menu#search'

  #LOGIN ROUTES
  match '/sign_in/' => 'login#signin'
  match '/sign_out/' => 'login#signout'

  #USER ROUTES
  match '/pengguna/cek' => 'user#callback_username'
  match '/user/:id/update_user' => 'user#update_user'
  match '/:id/delete_user' => 'user#delete_user'
  match '/search_user' => 'user#search'
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
  
  # PROFILE_ORGANISASI ADMIN ROUTES
  match "/profile_organisasi/:id/renew" => 'profile_organisasi#renew'
  match "/search_profile/" => 'profile_organisasi#search'
  resources :profile_organisasi, :except => [:update, :new, :destroy] do
   member do
    get 'delete'
  end
 end

# PROFILE ORGANISASI PUBLIC ROUTES'
scope :module => "public" do
    match "/profile/:shortname" => 'profile_organisasi#show'
end

# ADMIN SCOPE
scope :module => "admin" do
  #Article Type 
  resources :article_type, :except => [:update, :new, :destroy] do
    member  do
      get 'delete'
    end
  end
  match 'admin/article_type/:id/renew' => 'article_type#renew'
  match '/search_article_type/' => 'article_type#search'
  #Article entry
  resources :article, :except => [:update, :new, :destroy] do
    member do
      get 'delete'
    end
  end 
end

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
