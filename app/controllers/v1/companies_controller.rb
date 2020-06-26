# frozen_string_literal: true

module V1
  class CompaniesController < V1::BaseController
    def index
      company = Company.all
      paginate json: company
    end
  end
end

