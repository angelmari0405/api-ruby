# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    if request.method == 'POST' && resource.persisted?
      render json: {
        message: 'Usuario creado correctamente.',
        data: resource
      }, status: :ok
    elsif request.method == 'DELETE'
      render json: {
        message: 'Cuenta borrada correctamente.'
      }, status: :ok
    else
      render json: {
        message: "Usuario no puede ser creado.",
        errrors: resource.errors.full_messages.to_sentence
      }, status: :unprocessable_entity
    end
  end
end

