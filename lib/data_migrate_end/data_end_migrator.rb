require 'active_record'

module DataMigrate
  class DataMigratorEnd < ActiveRecord::Migrator
    class << self
      def schema_migrations_table_name
        ActiveRecord::Base.table_name_prefix + 'data_end_migrations' + ActiveRecord::Base.table_name_suffix
      end

      def migrations_path
        'db/data_end'
      end
    end
  end
end
