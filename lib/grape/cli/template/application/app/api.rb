module Example
  class API < Grape::API
    prefix 'api'
    format :json

    mount Example::HelloWorld

    add_swagger_documentation api_version: 'v1'
  end
end
