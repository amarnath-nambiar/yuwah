require "test_helper"

class CollegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @college = colleges(:one)
  end

  test "should get index" do
    get colleges_url, as: :json
    assert_response :success
  end

  test "should create college" do
    assert_difference("College.count") do
      post colleges_url, params: { college: { city: @college.city, country: @college.country, description: @college.description, established_year: @college.established_year, name: @college.name, state: @college.state, website: @college.website } }, as: :json
    end

    assert_response :created
  end

  test "should show college" do
    get college_url(@college), as: :json
    assert_response :success
  end

  test "should update college" do
    patch college_url(@college), params: { college: { city: @college.city, country: @college.country, description: @college.description, established_year: @college.established_year, name: @college.name, state: @college.state, website: @college.website } }, as: :json
    assert_response :success
  end

  test "should destroy college" do
    assert_difference("College.count", -1) do
      delete college_url(@college), as: :json
    end

    assert_response :no_content
  end
end
