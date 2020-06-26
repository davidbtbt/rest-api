# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Companies', type: :request do
  it_behaves_like 'api listing', 'v1', :company
end
