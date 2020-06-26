# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::CompanySerializer' do
  let(:city) { create(:city, name: 'Seattle', state: 'WA') }
  let(:company) { create(:company, name: 'DavidCorp', city: city) }

  it 'serializes a city to json' do
    serializer = V1::CompanySerializer.new(company)
    json = serializer.as_json
    aggregate_failures 'json response' do
      expect(json.keys.size).to eq(3)
      expect(json[:id]).to eq(1)
      expect(json[:name]).to eq('DavidCorp')
      expect(json[:city]).to_not be_nil
    end
  end

end
