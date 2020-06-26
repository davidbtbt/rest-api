# frozen_string_literal: true

module V1
  class CitiesController < BaseController
    def index
      cities = City.all
      paginate json: cities
    end
  end
end

