Rails.application.routes.draw do
  root 'menu#index'

  get 'hello/index'
  get 'game' => 'game#index'
  get 'menu' => 'menu#index'
  get 'log_in' => 'sessions#new'
  get 'sign_up' => 'accounts#new'
  get 'save' => 'saves#new'
  get 'load' => 'loads#new'
  get 'profile' => 'profiles#index'
  get 'rules' => 'game#rules'

  post 'new_game' => 'game#start_new_game'
  post 'profile' => 'menu#on_click_profile'
  post 'log_in' => 'menu#on_click_button_login'
  post 'sign_up' => 'menu#on_click_button_signup'
  post 'log_out' => 'menu#on_click_button_logout'

  get 'go_job' => 'game#go_job'
  get 'rest' => 'game#rest'
  get 'watch_serial' => 'game#watch_serial'
  get 'drink_with_marginals' => 'game#drink_with_marginals'
  get 'sleep' => 'game#sleep'
  get 'sing' => 'game#sing'

  resources :accounts
  resources :sessions
  resources :profiles
  resources :saves
  resources :loads
end
