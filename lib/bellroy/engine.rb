module Bellroy
  class Engine < Rails::Engine

    initializer "bellroy.configure_rails_initialization" do |app|

      app.routes.prepend do
        get 'breadcrumb'        => 'global_resources#breadcrumb'
        get "r/:encrypted_url"  => 'redirector#show', :as => :redirector
        get "redirector"        => 'redirector#internal', :as => :internal_redirector
      end

    end

    initializer "bellroy.update_asset_paths" do |app|
      app.config.assets.precompile += Bellroy::Assets.precompile_as_engine
    end

    initializer :assets do |config|
      # Rails.application.config.assets.paths << root.join('node_modules/')
    end
  end
end
