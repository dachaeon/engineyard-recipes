require 'thor/group'

module Engineyard::Recipes
  module Generators
    class InitGenerator < BaseGenerator
      include Thor::Actions

      argument :flags, :type => :hash
      
      def self.source_root
        File.join(File.dirname(__FILE__), "init_resin_chef_generator", "templates")
      end
      
      def install_cookbooks
        if on_deploy?
          directory "deploy"
        end
        unless File.exists?(File.join(destination_root, "#{cookbooks_destination}/main/recipes/default.rb"))
          directory "cookbooks", cookbooks_destination
        end
      end
      
      protected
      def cookbooks_destination
        if on_deploy?
          "deploy/cookbooks"
        else
          "cookbooks"
        end
      end
      
      def on_deploy?
        flags[:on_deploy]
      end
      
      def bundled_chef?
        flags[:bundled_chef]
      end
    end
  end
end
