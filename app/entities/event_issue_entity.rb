# frozen_string_literal: true

class EventIssueEntity
  attr_accessor :number, :action, :url

  def initialize(event_issue_params)
    @number = event_issue_params.dig(:issue, 'number')
    @url = event_issue_params.dig(:issue, 'url')
    @action = event_issue_params.dig(:event, 'action')
  end

  def to_params
    {
      number: @number,
      action: @action,
      issue_url: @url,
    }
  end
end
