class SpecimenTypeVersionsController < ApplicationController
  before_action :set_specimen_type_version, only: [:show, :edit, :update, :destroy]
  before_action :authorize_specimen_type_versions, only: [:new, :create, :index]

  # GET /specimen_type_versions
  def index
    @page = params[:page]
    @per_page = 10

    @specimen_type_versions_filtered = params[:q].present? ? SpecimenTypeVersion.by_name(params[:q]) : SpecimenTypeVersion.all

    @specimen_type_versions = @specimen_type_versions_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @specimen_type_versions.to_csv }
    end
  end

  # GET /specimen_type_versions/1
  def show
  end

  # GET /specimen_type_versions/new
  def new
    @specimen_type_version = SpecimenTypeVersion.new
  end

  # GET /specimen_type_versions/1/edit
  def edit
  end

  # POST /specimen_type_versions
  def create
    @specimen_type_version = SpecimenTypeVersion.new(specimen_type_version_params)

    if @specimen_type_version.save
      redirect_to @specimen_type_version
    else
      render :new
    end
  end

  # PATCH/PUT /specimen_type_versions/1
  def update
    if @specimen_type_version.update(specimen_type_version_params)
      redirect_to @specimen_type_version
    else
      render :edit
    end
  end

  # DELETE /specimen_type_versions/1
  def destroy
    if @specimen_type_version.destroy
      redirect_to specimen_type_versions_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specimen_type_version
      @specimen_type_version = SpecimenTypeVersion.find(params[:id])
      authorize @specimen_type_version
    end

    # Authorization for class.
    def authorize_specimen_type_versions
      authorize SpecimenTypeVersion
    end

    # Only allow a trusted parameter "white list" through.
    def specimen_type_version_params
      params.require(:specimen_type_version).permit(:specimen_type_id, :name, :data)
    end
end
