Rails.application.routes.draw do
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  #:at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default
  # of "spree"

  mount Spree::Core::Engine, at: '/'
  # get 'contacto' => 'pages#contacto'
  # get 'contactodevelop' => 'pages#contactodevelop'
  get 'international_orders' => 'pages#international_orders'
  get 'confirm_international_order' => 'pages#confirm_international_order'

  get 'terminos' => 'pages#terminos'
  get 'availables' => 'pages#availables'
  get 'modelos' => 'model_filter#index'
  get 'ofertas' => 'pages#sales'
  get 'sku_search' => 'tasks#sku_search'

  # Rutas formulario de contacto
  match '/international/order/form', to: 'spree/international_order_forms#create', via: :get
  match '/contacto', to: 'spree/contacts#new', via: :get
  # match '/ultimos', to: 'pages#ultimos', via: :get
  # get 'detalle_venta' => 'pages#detalle_venta'
  # get 'search' => 'custom_search#search'

  # get 'users' => 'pages#users'

  # Reportes
  match 'users_database', to: 'tasks#users_database', via: :get
  get 'dailyreport' => 'daily#send_report'
  get 'yesterdayreport' => 'daily#report_yesterday'
  get 'customreport' => 'daily#custom_report'

  resources :contacts, only: %i[new create]
  resources :international_order_forms, only: %i[new create]

  # if Rails.env.development?
  #   mount MailPreview => 'mail_view'
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'spree#home#index'

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
