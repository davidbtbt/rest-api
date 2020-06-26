# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::People', type: :request do
  it_behaves_like 'api listing', 'v1', :person
  it_behaves_like 'api show', 'v1', :person


end
