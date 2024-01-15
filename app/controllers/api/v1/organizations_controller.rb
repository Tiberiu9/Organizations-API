class Api::V1::OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: %i[show update destroy]

  # GET /organizations
  def index
    @organizations = Organization.by_user(current_user)
    render json: @organizations
  end

  # GET /organizations/1
  def show
    render json: @organization
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    render json: { message: "Organization #{@organization.name} deleted!" }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.by_user(current_user).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Unable to find Organization. Please specify the ID of the organization in the 
    request URL. SYNTAX: https://organizations.fly.dev/api/v1/organizations//"ID OF THE ORGANIZATION"'}, status: 404
  end

  # Only allow a list of trusted parameters through.
  def organization_params
    params.require(:organization).permit(:name, :website, :country, :description, :founded, :industry,
                                         :employees_number).with_defaults(user_id: current_user.id)
  end
end
