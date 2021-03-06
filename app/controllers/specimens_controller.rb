class SpecimensController < ApplicationController
  before_action :set_work_order
  before_action :set_specimen, only: [:show, :edit, :update, :destroy]
  before_action :authorize_specimens, only: [:new, :create, :index]

  # GET /specimens
  def index
    if request.format.xls?
      @sheets = Specimen.where(sample_id: @work_order.samples.pluck(:id).flatten).to_xls
    else
      @page = params[:page]
      @per_page = 10
      @specimens_filtered = params[:q].present? ? @work_order.specimens.by_name(params[:q]) : @work_order.specimens
      @specimens = @specimens_filtered.paginate page: params[:page], per_page: @per_page
    end

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      format.xls
      #format.csv { send_data @specimens.to_csv }
    end
  end

  # GET /specimens/1
  def show
  end

  # GET /specimens/new
  def new
    @specimen = params["specimen"] ? Specimen.new(specimen_params) : Specimen.new
    @specimen_type_versions = SpecimenType.versions_for(@work_order)
  end

  # GET /specimens/1/edit
  def edit
    @specimen_type_versions = SpecimenType.versions_for(@work_order)
  end

  # POST /specimens
  def create
    @specimen = Specimen.new(specimen_params)
    # @specimen.work_order = @work_order

    if @specimen.save
      redirect_to [@work_order, @specimen]
    else
      @specimen_type_versions = SpecimenType.versions_for(@work_order)
      render :new
    end
  end

  # PATCH/PUT /specimens/1
  def update
    if @specimen.update(specimen_params)
      redirect_to [@work_order, @specimen]
    else
      @specimen_type_versions = SpecimenType.versions_for(@work_order)
      render :edit
    end
  end

  # DELETE /specimens/1
  def destroy
    if @specimen.destroy
      redirect_to specimens_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:work_order_id])
      authorize @work_order
    end

    def set_specimen
      @specimen = Specimen.find(params[:id])
      authorize @specimen
    end

    # Authorization for class.
    def authorize_specimens
      authorize Specimen
    end

    # Only allow a trusted parameter "white list" through.
    def specimen_params
      params.require(:specimen).permit(:code, :remarks, :sample_id, :specimen_type_id, :specimen_type_version_id, :prepared_by_id, :data, pictures_attributes: [ :id, :local_id, :image, :_destroy])
    end
end
