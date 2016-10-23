# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    with_options only: [:index, :show] do |options|
      options.resources :zombies
      options.resources :humans
    end
  end
end
