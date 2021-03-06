require 'thor/group'
require 'active_support/core_ext/string'

module Engineyard::Recipes
  module Generators
    class GemGenerator < BaseGenerator
      include Thor::Actions

      argument :recipe_name
      argument :repo_name
      argument :recipe_type
      
      def self.source_root
        File.join(File.dirname(__FILE__), "gem_generator", "templates")
      end
      
      def install_gem
        directory "gem", repo_name
      end
      
      def install_metadata
        directory "metadata", repo_name
      end

      def install_recipe
        if recipe_type == "recipe"
          directory "recipe", repo_name
        end
      end
      
      protected
      def git_user_name
        `git config  --global user.name`.strip
      end

      def git_user_email
        `git config  --global user.email`.strip
      end
    end
  end
end
