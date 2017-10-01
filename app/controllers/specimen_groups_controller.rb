class SpecimenGroupsController < ApplicationController
  before_action :set_specimen_group, only: [:show, :edit, :update, :destroy]
  before_action :authorize_specimen_groups, only: [:new, :create, :index]

  # GET /specimen_groups
  def index
    @page = params[:page]
    @per_page = 10

    @specimen_groups_filtered = params[:q].present? ? SpecimenGroup.by_name(params[:q]) : SpecimenGroup.all

    @specimen_groups = @specimen_groups_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @specimen_groups.to_csv }
    end
  end

  # GET /specimen_groups/1
  def show
  end

  # GET /specimen_groups/new
  def new
    @specimen_group = SpecimenGroup.new
  end

  # GET /specimen_groups/1/edit
  def edit
  end

  # POST /specimen_groups
  def create
    @specimen_group = SpecimenGroup.new(specimen_group_params)

    if @specimen_group.save
      redirect_to @specimen_group
    else
      render :new
    end
  end

  # PATCH/PUT /specimen_groups/1
  def update
    if @specimen_group.update(specimen_group_params)
      redirect_to @specimen_group
    else
      render :edit
    end
  end

  # DELETE /specimen_groups/1
  def destroy
    if @specimen_group.destroy
      redirect_to specimen_groups_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specimen_group
      @specimen_group = SpecimenGroup.find(params[:id])
      authorize @specimen_group
    end

    # Authorization for class.
    def authorize_specimen_groups
      authorize SpecimenGroup
    end

    # Only allow a trusted parameter "white list" through.
    def specimen_group_params
      params.require(:specimen_group).permit(:work_order_id, :name, :description)
    end
end
