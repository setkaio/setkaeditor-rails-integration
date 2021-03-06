require "grid/editor_integration/storages/file"
require "grid/editor_integration/storages/s3"

module Grid
  module EditorIntegration
    module Storages
      class Factory
        def self.create_storage(name, path = nil, cdn_url = "", options = {})

          "Grid::EditorIntegration::Storages::#{name.capitalize}".
            constantize.new(path, cdn_url, options)
        end

        def self.create_from_global_settings
          create_storage(
            Grid::EditorIntegration.storage,
            Grid::EditorIntegration.path,
            Grid::EditorIntegration.cdn_url,
            Grid::EditorIntegration.options_for_storage)
        end
      end
    end
  end
end
