module Refinery
  class NewsGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates", __FILE__)

    def generate_news_initializer
      template "config/initializers/refinery/news.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "news.rb")
    end

    def rake_db
      rake("refinery_news:install:migrations")
      rake("refinery_settings:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS News engine
Refinery::News::Engine.load_seed
        EOH
      end
    end
  end
end
