# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'api listing' do |version, model|
  plural_model = model.to_s.pluralize.to_sym

  describe "GET /#{plural_model}" do
    context 'when there are no records' do
      it 'responds with empty array' do
        get "/#{version}/#{plural_model}"
        expect(response_as_json).to eq([])
      end
    end

    context 'when records exist' do
      let!(plural_model) { create_list model, 10 }

      it "returns #{plural_model}" do
        get "/#{version}/#{plural_model}"
        expect(response_as_json.size).to eq(10)
      end

      it 'returns a smaller portion per page' do
        get "/#{version}/#{plural_model}?per_page=2"
        expect(response_as_json.size).to eq(2)
      end

      it 'returns empty when page is out of range' do
        get "/#{version}/#{plural_model}?per_page=2&page=11"
        expect(response_as_json).to eq([])
      end
    end
  end
end
