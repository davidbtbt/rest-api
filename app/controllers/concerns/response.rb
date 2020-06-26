# frozen_string_literal: true

module Response
  def with_json_response(status = :ok, &block)
    render json: block.call, status: status
  end
end
