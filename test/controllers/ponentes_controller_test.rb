require 'test_helper'

class PonentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ponente = ponentes(:one)
  end

  test "should get index" do
    get ponentes_url
    assert_response :success
  end

  test "should get new" do
    get new_ponente_url
    assert_response :success
  end

  test "should create ponente" do
    assert_difference('Ponente.count') do
      post ponentes_url, params: { ponente: { bio: @ponente.bio, correo: @ponente.correo, dni: @ponente.dni, nombres: @ponente.nombres, tags: @ponente.tags, telefono: @ponente.telefono } }
    end

    assert_redirected_to ponente_url(Ponente.last)
  end

  test "should show ponente" do
    get ponente_url(@ponente)
    assert_response :success
  end

  test "should get edit" do
    get edit_ponente_url(@ponente)
    assert_response :success
  end

  test "should update ponente" do
    patch ponente_url(@ponente), params: { ponente: { bio: @ponente.bio, correo: @ponente.correo, dni: @ponente.dni, nombres: @ponente.nombres, tags: @ponente.tags, telefono: @ponente.telefono } }
    assert_redirected_to ponente_url(@ponente)
  end

  test "should destroy ponente" do
    assert_difference('Ponente.count', -1) do
      delete ponente_url(@ponente)
    end

    assert_redirected_to ponentes_url
  end
end
