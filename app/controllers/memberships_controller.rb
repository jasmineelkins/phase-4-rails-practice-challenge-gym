class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  # GET /memberships
  def index
    memberships = Membership.all
    render json: memberships
  end

  # GET /memberships/:id
  def show
    membership = find_membership
    render json: membership
  end

  # POST /memberships
  def create
    new_membership = Membership.create!(membership_params)
    render json: new_membership, status: :created
  end

  # UPDATE /memberships/:id
  def update
    membership = find_membership
    membership.update!(membership_params)
    render json: membership
  end

  # DELETE /memberships/:id
  def destroy
    membership = find_membership
    membership.destroy
    render json: {}
  end

  private

  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def find_membership
    Membership.find_by!(id: params[:id])
  end

  def render_invalid_response(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
