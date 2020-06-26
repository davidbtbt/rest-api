# frozen_string_literal: true

module V1
  class CompanySerializer < ActiveModel::Serializer
    attributes :id, :name # , :created_at, :updated_at
    has_one :city
  end
end
