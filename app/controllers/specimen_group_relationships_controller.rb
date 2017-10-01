class SpecimenGroupRelationshipsController < ApplicationController
  before_action :set_specimen_group_relationship, only: [:show, :edit, :update, :destroy]
  before_action :authorize_specimen_group_relationships, only: [:new, :create, :index]

  # GET /specimen_group_relationships
  def index
    @page = params[:page]
    @per_page = 10

    @specimen_group_relationships_filtered = params[:q].present? ? SpecimenGroupRelationship.by_name(params[:q]) : SpecimenGroupRelationship.all

    @specimen_group_relationships = @specimen_group_relationships_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @specimen_group_relationships.to_csv }
    end
  end

  # GET /specimen_group_relationships/1
  def show
  end

  # GET /specimen_group_relationships/new
  def new
    @specimen_group_relationship = SpecimenGroupRelationship.new
  end

  # GET /specimen_group_relationships/1/edit
  def edit
  end

  # POST /specimen_group_relationships
  def create
    @specimen_group_relationship = SpecimenGroupRelationship.new(specimen_group_relationship_params)

    if @specimen_group_relationship.save
      redirect_to @specimen_group_relationship
    else
      render :new
    end
  end

  # PATCH/PUT /specimen_group_relationships/1
  def update
    if @specimen_group_relationship.update(specimen_group_relationship_params)
      redirect_to @specimen_group_relationship
    else
      render :edit
    end
  end

  # DELETE /specimen_group_relationships/1
  def destroy
    if @specimen_group_relationship.destroy
      redirect_to specimen_group_relationships_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specimen_group_relationship
      @specimen_group_relationship = SpecimenGroupRelationship.find(params[:id])
      authorize @specimen_group_relationship
    end

    # Authorization for class.
    def authorize_specimen_group_relationships
      authorize SpecimenGroupRelationship
    end

    # Only allow a trusted parameter "white list" through.
    def specimen_group_relationship_params
      params.require(:specimen_group_relationship).permit(:specimen_id, :specimen_group_id)
    end
end
