require 'test_helper'

class FavcompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favcompany = favcompanies(:one)
  end

  test "should get index" do
    get favcompanies_url
    assert_response :success
  end

  test "should get new" do
    get new_favcompany_url
    assert_response :success
  end

  test "should create favcompany" do
    assert_difference('Favcompany.count') do
      post favcompanies_url, params: { favcompany: { name: @favcompany.name } }
    end

    assert_redirected_to favcompany_url(Favcompany.last)
  end

  test "should show favcompany" do
    get favcompany_url(@favcompany)
    assert_response :success
  end

  test "should get edit" do
    get edit_favcompany_url(@favcompany)
    assert_response :success
  end

  test "should update favcompany" do
    patch favcompany_url(@favcompany), params: { favcompany: { name: @favcompany.name } }
    assert_redirected_to favcompany_url(@favcompany)
  end

  test "should destroy favcompany" do
    assert_difference('Favcompany.count', -1) do
      delete favcompany_url(@favcompany)
    end

    assert_redirected_to favcompanies_url
  end
end
