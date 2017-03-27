require 'test_helper'

class EventoPonentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evento_ponente = evento_ponentes(:one)
  end

  test "should get index" do
    get evento_ponentes_url
    assert_response :success
  end

  test "should get new" do
    get new_evento_ponente_url
    assert_response :success
  end

  test "should create evento_ponente" do
    assert_difference('EventoPonente.count') do
      post evento_ponentes_url, params: { evento_ponente: { event_id: @evento_ponente.event_id, ponente_id: @evento_ponente.ponente_id, rate: @evento_ponente.rate, tema: @evento_ponente.tema } }
    end

    assert_redirected_to evento_ponente_url(EventoPonente.last)
  end

  test "should show evento_ponente" do
    get evento_ponente_url(@evento_ponente)
    assert_response :success
  end

  test "should get edit" do
    get edit_evento_ponente_url(@evento_ponente)
    assert_response :success
  end

  test "should update evento_ponente" do
    patch evento_ponente_url(@evento_ponente), params: { evento_ponente: { event_id: @evento_ponente.event_id, ponente_id: @evento_ponente.ponente_id, rate: @evento_ponente.rate, tema: @evento_ponente.tema } }
    assert_redirected_to evento_ponente_url(@evento_ponente)
  end

  test "should destroy evento_ponente" do
    assert_difference('EventoPonente.count', -1) do
      delete evento_ponente_url(@evento_ponente)
    end

    assert_redirected_to evento_ponentes_url
  end
end
