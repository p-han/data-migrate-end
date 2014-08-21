require 'generators/data_migrate_end'
require 'rails/generators'
require 'rails/generators/migration'

module DataMigrateEnd
  module Generators
    class DataEndMigrationGenerator < Rails::Generators::NamedBase
      namespace "data_end_migration"
      source_root File.join(File.dirname(__FILE__), 'templates')
      include Rails::Generators::Migration

      def create_data_end_migration
        migration_template "data_end_migration.rb", "db/data_end/#{file_name}_data_migration.rb"
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
    end
  end
end
