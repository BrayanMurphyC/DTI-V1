require 'test_helper'

class RegistroEventosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro_evento = registro_eventos(:one)
  end

  test "should get index" do
    get registro_eventos_url
    assert_response :success
  end

  test "should get new" do
    get new_registro_evento_url
    assert_response :success
  end

  test "should create registro_evento" do
    assert_difference('RegistroEvento.count') do
      post registro_eventos_url, params: { registro_evento: { asistencia: @registro_evento.asistencia, certificado: @registro_evento.certificado, event_id: @registro_evento.event_id, subscriber_id: @registro_evento.subscriber_id } }
    end

    assert_redirected_to registro_evento_url(RegistroEvento.last)
  end

  test "should show registro_evento" do
    get registro_evento_url(@registro_evento)
    assert_response :success
  end

  test "should get edit" do
    get edit_registro_evento_url(@registro_evento)
    assert_response :success
  end

  test "should update registro_evento" do
    patch registro_evento_url(@registro_evento), params: { registro_evento: { asistencia: @registro_evento.asistencia, certificado: @registro_evento.certificado, event_id: @registro_evento.event_id, subscriber_id: @registro_evento.subscriber_id } }
    assert_redirected_to registro_evento_url(@registro_evento)
  end

  test "should destroy registro_evento" do
    assert_difference('RegistroEvento.count', -1) do
      delete registro_evento_url(@registro_evento)
    end

    assert_redirected_to registro_eventos_url
  end
end
