require 'rails_helper'

describe Api::CompaniesController do
  context 'GET #index' do
    before { get :index, format: :json }

    it { should respond_with(200) }
  end
end
