require 'thor/group'

module Engineyard::Recipes
  module Generators
    class CookbooksNotFound < StandardError; end

    class BaseGenerator < Thor::Group
      include Thor::Actions


      protected
      def cookbooks_destination
        @cookbooks_destination ||= begin
          possible_paths = ['deploy/cookbooks', 'cookbooks']
          destination = possible_paths.find do |cookbooks|
            File.directory?(File.join(destination_root, cookbooks))
          end
          raise CookbooksNotFound unless destination
          destination
        end
      end
      
      def cookbooks_dir(child_path)
        File.join(cookbooks_destination, child_path)
      end
      
      def say(msg, color = nil)
        color ? shell.say(msg, color) : shell.say(msg)
      end
    end
  end
end