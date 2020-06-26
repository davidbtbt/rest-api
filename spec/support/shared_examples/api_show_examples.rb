# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'api show' do |version, model|
  plural_model = model.to_s.pluralize.to_sym

  describe "GET /#{plural_model}/id" do
    context 'when there are no records' do

      it 'responds with error message and 404 code' do
        get "/#{version}/#{plural_model}/bad-id"
        aggregate_failures 'json response' do
          expect(response.code).to eq('404')
          expect(response.body).to eq(
            { "message": "Couldn't find Person with 'id'=bad-id" }.to_json
          )
        end
      end
    end

    context 'when records exist' do
      let(:model_list) { create_list model, 10 }
      let(:test_model) { model_list.last }

      it "shows #{model}" do
        get "/#{version}/#{plural_model}/#{test_model.id}"
        aggregate_failures 'json response' do
          expect(response.code).to eq('200')
          expect(response_as_json['name']).to eq(test_model.name)
          expect(response_as_json['email']).to eq(test_model.email)
          expect(response_as_json['company']).to_not be_empty
          expect(response_as_json['city']).to_not be_empty
        end
      end
    end
  end
end
