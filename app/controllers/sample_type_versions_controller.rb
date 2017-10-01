class SampleTypeVersionsController < ApplicationController
  before_action :set_sample_type_version, only: [:show, :edit, :update, :destroy]
  before_action :authorize_sample_type_versions, only: [:new, :create, :index]

  # GET /sample_type_versions
  def index
    @page = params[:page]
    @per_page = 10

    @sample_type_versions_filtered = params[:q].present? ? SampleTypeVersion.by_name(params[:q]) : SampleTypeVersion.all

    @sample_type_versions = @sample_type_versions_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @sample_type_versions.to_csv }
    end
  end

  # GET /sample_type_versions/1
  def show
  end

  # GET /sample_type_versions/new
  def new
    @sample_type_version = SampleTypeVersion.new
  end

  # GET /sample_type_versions/1/edit
  def edit
  end

  # POST /sample_type_versions
  def create
    @sample_type_version = SampleTypeVersion.new(sample_type_version_params)

    if @sample_type_version.save
      redirect_to @sample_type_version
    else
      render :new
    end
  end

  # PATCH/PUT /sample_type_versions/1
  def update
    if @sample_type_version.update(sample_type_version_params)
      redirect_to @sample_type_version
    else
      render :edit
    end
  end

  # DELETE /sample_type_versions/1
  def destroy
    if @sample_type_version.destroy
      redirect_to sample_type_versions_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_type_version
      @sample_type_version = SampleTypeVersion.find(params[:id])
      authorize @sample_type_version
    end

    # Authorization for class.
    def authorize_sample_type_versions
      authorize SampleTypeVersion
    end

    # Only allow a trusted parameter "white list" through.
    def sample_type_version_params
      params.require(:sample_type_version).permit(:sample_type_id, :name, :data)
    end
end
