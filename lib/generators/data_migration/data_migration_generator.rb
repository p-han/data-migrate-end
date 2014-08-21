require 'generators/data_migrate'
require 'rails/generators'
require 'rails/generators/migration'

module DataMigrate
  module Generators
    class DataMigrationGenerator < Rails::Generators::NamedBase
      namespace "data_migration"
      include Rails::Generators::Migration

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      class_option :skip_schema_migration, :desc => 'Dont generate database schema migration file.', :type => :boolean

      def create_data_migration
        set_local_assigns!
        unless  options.skip_schema_migration?
          migration_template "migration.rb", "db/migrate/#{file_name}.rb"
        end
        migration_template "data_migration.rb", "db/data/#{file_name}_data_migration.rb"
      end

      protected
      attr_reader :migration_action

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.new.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      def set_local_assigns!
        if file_name =~ /^(add|remove)_.*_(?:to|from)_(.*)/
          @migration_action = $1
          @table_name       = $2.pluralize
        end
      end
    end
  end
end
