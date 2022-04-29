class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /gyms
  def index
    gyms = Gym.all
    render json: gyms
  end

  # GET /gyms/:id
  def show
    gym = find_gym
    render json: gym
  end

  # POST /gyms
  def create
    new_gym = Gym.create!(gym_params)
    render json: new_gym, status: :created
  end

  # UPDATE /gyms/:id
  def update
    gym = find_gym
    gym.update!(gym_params)
    render json: gym
  end

  # DELETE /gyms/:id
  def destroy
    gym = find_gym
    gym.destroy
    render json: {}
  end

  private

  def gym_params
    params.permit(:name, :address)
  end

  def find_gym
    Gym.find_by!(id: params[:id])
  end

  def render_invalid_response(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end

  def render_not_found_response
    render json: { error: 'Gym not found' }, status: :not_found
  end
end
