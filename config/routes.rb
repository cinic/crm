Crm::Application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  
  resources :users
  get 'leads/:id/edit_realtor', to: 'leads#edit_realtor', as: 'edit_realtor_lead'
  get 'leads/:id/new_landlord_lead', to: 'leads#new_landlord_lead', as: 'new_landlord_lead'
  get 'leads/:id/new_apartment_lead', to: 'leads#new_apartment_lead', as: 'new_apartment_lead'
  resources :leads
  
  get 'landlords/wizard', to: 'landlords#new_without_lead', as: 'landlord_wizard_without_lead'
  post 'landlords/wizard', to: 'landlords#save_wizard_step_0'
  get 'landlords/:id/wizard_step_1', to: 'landlords#new_landlord_wizard', as: 'new_landlord_wizard'
  patch 'landlords/:id/wizard_step_1', to: 'landlords#save_wizard_step_1'
  get 'landlords/:id/wizard_step_2', to: 'landlords#wizard_step_2', as: 'landlord_wizard_step_2'
  post 'landlords/:id/wizard_step_2', to: 'landlords#save_wizard_step_2'
  get 'landlords/:id/wizard_step_3', to: 'landlords#wizard_step_3', as: 'landlord_wizard_step_3'
  patch 'landlords/:id/wizard_step_3', to: 'landlords#save_wizard_step_3'
  get 'landlords/:id/wizard_step_4', to: 'landlords#wizard_step_4', as: 'landlord_wizard_step_4'
  resources :landlords
  resources :tenants
  resources :deals
  resources :apartments
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
  root 'dashboard#index', as: 'dashboard'
end
