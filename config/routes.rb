Crm::Application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  resources :password_resets, only: [:new, :create, :edit, :update]
  
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
  patch 'landlords/:id/wizard_step_4', to: 'landlords#save_wizard_step_4'
  resources :landlords
  resources :tenants
  resources :deals
  resources :apartments

  root 'dashboard#index', as: 'dashboard'
end
