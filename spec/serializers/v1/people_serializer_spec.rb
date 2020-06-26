# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::PeopleSerializer' do
  let(:city) { create(:city, name: 'Seattle', state: 'WA') }
  let(:company) { create(:company, name: 'DavidCorp', city: city) }
  let(:person) do
    create(:person,
           name: 'David', email: 'david@example.com',
           city: city, company: company)
  end

  it 'serializes a person to json' do
    serializer = V1::PersonSerializer.new(person)
    json = serializer.as_json
    aggregate_failures 'json response' do
      expect(json.keys.size).to eq(5)
      expect(json[:id]).to eq(1)
      expect(json[:name]).to eq('David')
      expect(json[:email]).to eq('david@example.com')
      expect(json[:city]).to_not be_nil
      expect(json[:company]).to_not be_nil
    end
  end

end
