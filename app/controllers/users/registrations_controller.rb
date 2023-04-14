class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  protected

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up sucessfully.' }
  end

  def register_failed
    # return errors
    render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
  end
end
