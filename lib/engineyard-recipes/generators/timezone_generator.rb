require 'thor/group'

module Engineyard::Recipes
  module Generators
    class TimezoneGenerator < BaseGenerator
      include Thor::Actions
      class InvalidTimezone < StandardError; end
      
      argument :timezone

      def self.source_root
        File.join(File.dirname(__FILE__), "timezone_generator", "templates")
      end
      
      def check_timezone
        raise InvalidTimezone.new(timezone) unless timezones =~ /^#{timezone}$/
      end
      
      def install_cookbooks
        directory "cookbooks", cookbooks_destination
      end

      def auto_require_package
        file = cookbooks_dir "main/recipes/default.rb"
        require_recipe = "\nrequire_recipe '#{recipe_name}'\n"
        append_to_file file, require_recipe
      end
      
      protected
      def recipe_name
        'timezone-override'
      end
      
      def timezones
        timezones ||= File.read(File.expand_path("../../zonefiles", __FILE__))
      end
    end
  end
end
