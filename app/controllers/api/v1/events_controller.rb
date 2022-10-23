# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      http_basic_authenticate_with name: ENV.fetch('USER'), password: ENV.fetch('PASSWORD'), only: :webhook

      def show
        @events = Event.where(number: params[:issue_number])
      end

      def webhook
        entity = EventIssueEntity.new(event_issue_params)
        event = Event.new(**entity.to_params)

        if event.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      private

      def event_issue_params
        params.permit(issue: %i[number url], event: [:action]).to_h.symbolize_keys
      end
    end
  end
end
