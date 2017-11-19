class SamplesController < ApplicationController
  before_action :set_work_order
  before_action :set_sample, only: [:show, :edit, :update, :destroy]
  before_action :authorize_samples, only: [:new, :create, :index]

  # GET /samples
  def index
    if request.format.xls?
      @sheets = Sample.where(work_order: @work_order).to_xls
    else
      @page = params[:page]
      @per_page = 10
      @samples_filtered = params[:q].present? ? @work_order.samples.by_name(params[:q]) : @work_order.samples
      @samples = @samples_filtered.paginate page: params[:page], per_page: @per_page
    end

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      format.xls
      #format.csv { send_data @samples.to_csv }
    end
  end

  # GET /samples/1
  def show
  end

  # GET /samples/new
  def new
    @sample = Sample.new
    @sample_type_versions = SampleType.versions_for(@work_order)
  end

  # GET /samples/1/edit
  def edit
    @sample_type_versions = SampleType.versions_for(@work_order)
  end

  # POST /samples
  def create
    @sample = Sample.new(sample_params)
    @sample.work_order = @work_order

    if @sample.save
      redirect_to [@work_order, @sample]
    else
      @sample_type_versions = SampleType.versions_for(@work_order)
      render :new
    end
  end

  # PATCH/PUT /samples/1
  def update
    if @sample.update(sample_params)
      redirect_to [@work_order, @sample]
    else
      @sample_type_versions = SampleType.versions_for(@work_order)
      render :edit
    end
  end

  # DELETE /samples/1
  def destroy
    if @sample.destroy
      redirect_to work_order_samples_url(@work_order)
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:work_order_id])
      authorize @work_order, :show?
    end

    def set_sample
      @sample = Sample.find(params[:id])
      authorize @sample
    end

    # Authorization for class.
    def authorize_samples
      authorize Sample
    end

    # Only allow a trusted parameter "white list" through.
    def sample_params
      params.require(:sample).permit(:code, :remarks, :sample_type_id, :sample_type_version_id, :work_order_id, :data, pictures_attributes: [ :id, :local_id, :image, :_destroy ])
    end
end
