Rails.application.routes.draw do
  resources :repo_meta
  get 'profile/star'
  root 'home#index'
  get 'test/index' # TODO 用于一些测试, 以后会删除
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
