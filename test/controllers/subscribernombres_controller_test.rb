require 'test_helper'

class SubscribernombresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscribernombre = subscribernombres(:one)
  end

  test "should get index" do
    get subscribernombres_url
    assert_response :success
  end

  test "should get new" do
    get new_subscribernombre_url
    assert_response :success
  end

  test "should create subscribernombre" do
    assert_difference('Subscribernombre.count') do
      post subscribernombres_url, params: { subscribernombre: { apellidos: @subscribernombre.apellidos, correo: @subscribernombre.correo, preferencias: @subscribernombre.preferencias } }
    end

    assert_redirected_to subscribernombre_url(Subscribernombre.last)
  end

  test "should show subscribernombre" do
    get subscribernombre_url(@subscribernombre)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscribernombre_url(@subscribernombre)
    assert_response :success
  end

  test "should update subscribernombre" do
    patch subscribernombre_url(@subscribernombre), params: { subscribernombre: { apellidos: @subscribernombre.apellidos, correo: @subscribernombre.correo, preferencias: @subscribernombre.preferencias } }
    assert_redirected_to subscribernombre_url(@subscribernombre)
  end

  test "should destroy subscribernombre" do
    assert_difference('Subscribernombre.count', -1) do
      delete subscribernombre_url(@subscribernombre)
    end

    assert_redirected_to subscribernombres_url
  end
end
