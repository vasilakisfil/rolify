module Rolify
  module Generators
    class RoleGenerator < Rails::Generators::NamedBase
      Rails::Generators::ResourceHelpers
      
      source_root File.expand_path('../templates', __FILE__)
      argument :user_cname, :type => :string, :default => "User"

      hook_for :orm, :required => true

      desc "Generates a model with the given NAME and a migration file."

      def copy_initializer_file
        template "initializer.rb", "config/initializers/rolify.rb"
      end
      
      def show_readme
        if behavior == :invoke
          readme "README"
          readme "README-#{options.orm}"
        end
      end
    end
  end
end
