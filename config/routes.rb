Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :slides, except: :show do
      collection do
        post :update_positions
      end
    end

    resources :slide_locations, except: :show
  end
end
