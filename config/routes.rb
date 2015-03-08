Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

=begin
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:omniauth_callbacks] = 'omniauth_callbacks'
  devise_for :users, devise_config
=end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  

  resources :posts do
    resources :comments
  end

  root :to => 'posts#index'
end
