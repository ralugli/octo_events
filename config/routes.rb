Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      scope :events, controller: :events, as: :events do
        post 'webhook'
        get ':issue_number/issues', action: :show
      end
    end
  end
end
