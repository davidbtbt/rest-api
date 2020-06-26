# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::CitySerializer' do
  let(:city) { create(:city, name: 'Seattle', state: 'WA') }
  it 'serializes a city to json' do
    serializer = V1::CitySerializer.new(city)
    json = serializer.as_json
    aggregate_failures 'json response' do
      expect(json.keys.size).to eq(3)
      expect(json[:id]).to eq(1)
      expect(json[:name]).to eq('Seattle')
      expect(json[:state]).to eq('WA')
    end
  end

end
