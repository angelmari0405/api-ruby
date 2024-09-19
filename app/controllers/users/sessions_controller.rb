# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  respond_to :json

  class Users::SessionsController < Devise::SessionsController
    respond_to :json
    private
  
    def respond_with(resource, _opts = {})
      render json: { message: 'Logueado correctamente.', data: resource }, status: :ok
    end
  
    def respond_to_on_destroy
      if current_user
        render json: { message: 'Log out correctamente' }, status: :ok
      else
        render json: { message: "No se puede encontrar una sesion activa." }, status: :unauthorized
      end
    end
  end
  
end