WebsiteOne::Application.routes.draw do
  root 'visitors#index'
  mount Mercury::Engine => '/'

<<<<<<< HEAD
  devise_for :users
  root 'visitors#index'
=======
  devise_for :users, :controllers => {:registrations => 'registrations'}
  # devise does not provide some GET routes, which causes routing exceptions
  get 'users' => redirect('/404.html')
  get 'users/sign_out' => redirect('/404.html')
  get 'users/password' => redirect('/404.html')

  get '/auth/:provider/callback' => 'authentications#create'
  get '/auth/failure' => 'authentications#failure'

  get '/auth/destroy/:id', to: 'authentications#destroy', via: :delete
>>>>>>> 641369618ab1bf3b41b9e9ea6706ae3c417188ba

  resources :projects do
    member do
      get :follow
      get :unfollow
    end
    resources :documents do
      put :mercury_update
      get :mercury_saved
    end
  end

end
