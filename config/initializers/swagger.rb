# # frozen_string_literal: true
#
# module Swagger
#   module Docs
#     # Swagger Config
#     class Config
#       def self.transform_path(path, api_version)
#         # Makes the API docs path distinct
#         "apidocs/#{path}"
#       end
#     end
#   end
# end
#
# Swagger::Docs::Config.register_apis(
#   {
#     '1.0': {
#       controller_base_path: '',
#       api_file_path: 'public/apidocs',
#       clean_directory: true
#     }
#   }
# )
