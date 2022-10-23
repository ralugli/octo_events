# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1',
      },
      consumes: ['application/json'],
      produces: ['application/json'],
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'localhost:3000',
            },
          },
        },
      ],
      components: {
        securitySchemes: {
          basic_auth: {
            type: :http,
            scheme: :basic,
          },
        },
        schemas: {
          events_response: {
            type: :object,
            properties: {
              events: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    id: {
                      type: :integer,
                    },
                    action: {
                      type: :string,
                    },
                    created_at: {
                      type: :string,
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
  }

  config.swagger_format = :yaml
end
