# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      with_json_response :not_found do
        { message: error.message }
      end
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      with_json_response :unprocessable_entity do
        { message: error.message }
      end
    end
  end
end
