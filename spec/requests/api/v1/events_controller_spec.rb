# frozen_string_literal: true

require 'swagger_helper'

RSpec.shared_context 'when receive webhook event' do |_accept_version|
  let(:basic_auth) { ::Base64.strict_encode64("#{ENV.fetch('USER')}:#{ENV.fetch('PASSWORD')}") }

  post 'webhook' do
    tags 'Webhook'
    security [basic_auth: []]

    parameter name: :body, in: :body

    response 201, 'created' do
      let(:Authorization) { "Basic #{basic_auth}" }
      let(:body) { JSON.parse(file_fixture('webhook_close_issue.json').read) }

      run_test! do |response|
        body = JSON response.body

        expect(response.status).to eq 201
        expect(body).to be_empty
      end
    end

    response 422, 'unprocessable_entity' do
      let(:Authorization) { "Basic #{basic_auth}" }
      let(:body) { {} }

      run_test! do |response|
        body = JSON response.body

        expect(response.status).to eq 422
        expect(body).to be_empty
      end
    end

    response 401, 'unauthorized' do
      let(:Authorization) { '' }
      let(:body) { {} }

      run_test! do |response|
        expect(response.status).to eq 401
      end
    end
  end
end

RSpec.shared_context 'when I search for events' do |_accept_version|
  get 'events' do
    tags 'Events'

    parameter name: 'issue_number', in: :path, type: :string, description: 'issue number'

    response 200, 'successful' do
      schema '$ref' => '#/components/schemas/events_response'

      let(:issue_number) { 1 }

      before do
        create(:event, number: 1)
      end

      run_test! do |response|
        body = JSON response.body

        expect(response.status).to eq(200)
        expect(body['events'].size).to eq(1)
      end
    end
  end
end

RSpec.describe Api::V1::EventsController do
  path '/api/v1/events/webhook' do
    include_context 'when receive webhook event'
  end

  path '/api/v1/events/{issue_number}/issues' do
    include_context 'when I search for events'
  end
end
