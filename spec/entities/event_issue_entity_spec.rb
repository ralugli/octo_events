# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventIssueEntity do
  subject(:entity) { described_class.new(params) }

  let(:params) do
    {
      issue: {
        'number' => 'number',
        'url' => 'url',
      },
      event: {
        'action' => 'action',
      },
    }
  end

  describe '#to_params' do
    subject { entity.to_params }

    let(:expect_params) do
      {
        number: 'number',
        action: 'action',
        issue_url: 'url',
      }
    end

    it { is_expected.to eq(expect_params) }
  end
end
