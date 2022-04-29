class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  # GET /clients
  def index
    clients = Client.all
    render json: clients
  end

  # GET /clients/:id
  def show
    client = find_client
    render json: client
  end

  # UPDATE /clients/:id
  def update
    client = find_client
    client.update!(client_params)
    render json: client
  end

  private

  def client_params
    params.permit(:name, :age)
  end

  def find_client
    Client.find_by!(id: params[:id])
  end

  def render_invalid_response(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
