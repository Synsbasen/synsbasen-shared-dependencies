require 'rails/railtie'

module SharedDependenciesGem
  class Railtie < Rails::Railtie
    # Dynamically load all initializers
    initializer 'shared_dependencies_gem.load_initializers' do
      puts Dir[File.expand_path('../initializers/*.rb', __FILE__)].count
      Dir[File.expand_path('../initializers/*.rb', __FILE__)].sort.each do |initializer|
        require initializer
      end
    end
  end
end
