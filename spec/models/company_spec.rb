# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer          not null
#
# Indexes
#
#  index_companies_on_city_id  (city_id)
require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to belong_to(:city) }
  it { is_expected.to validate_presence_of(:city) }

  it { is_expected.to have_many(:people) }
end
