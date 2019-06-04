Rails.application.routes.draw do
  resources :old_tables
  resources :data_tables
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'get_proccessed_data_tabel', to: 'data_tables#get_proccessed_data_table'
  get 'proccessed_old_data_tables', to: 'old_tables#get_proccessed_old_data_table'
  
end
