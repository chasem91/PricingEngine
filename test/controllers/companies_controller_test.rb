class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_companies_url
    assert_response :success
  end
end
