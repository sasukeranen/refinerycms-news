Refinery::Core::Engine.routes.draw do
  namespace :news, :path => Refinery::News.page_url do
    root :to => "items#index"
    get 'archive/:year(/:month)', :to => 'items#archive', :as => 'items_archive', :constraints => { :year => /\d{4}/, :month => /\d{1,2}/ }
    resources :items, :only => [:show, :index], :path => ''
  end

  namespace :news, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      scope :path => Refinery::News.page_url do
        root :to => "items#index"
        resources :items, :except => :show
      end
    end
  end
end
