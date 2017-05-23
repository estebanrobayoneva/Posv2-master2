Rails.application.routes.draw do

  resources :details
  resources :line_items
  resources :carts
  resources :courses
  get 'home/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :payments

  resources :receipts do

  end
  resources :store do
    member do
      get 'pay/:id' => 'store#pay'
      patch 'pay/:id' => 'store#pay'

    end
  end
  resources :products do
    collection { post :import }
  end



  resources :clients do
    member do
      get 'membership' => 'memberships#new'
      get 'pagocuota' => 'memberships#payQuota'
      get 'pagocuota/:id' => 'memberships#payQuotaReceipt'
      patch 'pagocuota/:id' => 'memberships#payQuotaReceipt'
    end

  end
  resources :memberships
  resources :detail_purchase_receipts
  resources :purchase_receipts
  resources :providers
  devise_scope :user do
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  resources :discounts
  resources :societies
  devise_for :users
  resources :categories

  get 'newCourse' => 'products#newCourse'
  post 'newCourse' => 'products#createCourse'
  get 'course/:id/edit' => 'products#editCourse'
  put 'course/:id' => 'products#updateCourse'
  patch 'course/:id' => 'products#updateCourse'
  get 'cursos' => 'products#indexCourse'
  get 'curso/:id' => 'products#showCourse'
  
  get 'search_products', to: 'products#search'
  get 'search_clients', to: 'clients#search'


  root 'home#index'
  get 'clients/:id' => 'clients#afiliacion'

  get 'search/create'
  get 'search/createmembership'
  get 'clients/:id' => 'clients#afiliacion'
  get 'reportes'=>'products#reports'
  get 'reportmembresias'=>'memberships#reports'
  get 'tienda' => 'store#index'


  get 'send_receipt' => 'line_items#send_receipt'
  post 'send_receipt' => 'line_items#send_receipt'

  get 'findParticipante' => 'line_items#findParticipante'
  post 'findParticipante' => 'line_items#findParticipante'
  
  get :send_receipt_mail, to: 'receipts#send_receipt_mail', as: :send_receipt_mail
 


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
