# frozen_string_literal: true

module RequestSpecHelper
  def response_as_json
    JSON.parse(response.body)
  end
end
