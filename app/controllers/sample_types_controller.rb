class SampleTypesController < ApplicationController
  before_action :set_sample_type, only: [:show, :edit, :update, :destroy]
  before_action :authorize_sample_types, only: [:new, :create, :index]

  # GET /sample_types
  def index
    @page = params[:page]
    @per_page = 10

    @sample_types_filtered = params[:q].present? ? SampleType.by_name(params[:q]) : SampleType.all

    @sample_types = @sample_types_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @sample_types.to_csv }
    end
  end

  # GET /sample_types/1
  def show
    @sample_type_versions = @sample_type.sample_type_versions
  end

  # GET /sample_types/new
  def new
    @sample_type = SampleType.new
  end

  # GET /sample_types/1/edit
  def edit
  end

  # POST /sample_types
  def create
    @sample_type = SampleType.new(sample_type_params)

    if @sample_type.save
      redirect_to @sample_type
    else
      render :new
    end
  end

  # PATCH/PUT /sample_types/1
  def update
    if @sample_type.update(sample_type_params)
      redirect_to @sample_type
    else
      render :edit
    end
  end

  # DELETE /sample_types/1
  def destroy
    if @sample_type.destroy
      redirect_to sample_types_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_type
      @sample_type = SampleType.find(params[:id])
      authorize @sample_type
    end

    # Authorization for class.
    def authorize_sample_types
      authorize SampleType
    end

    # Only allow a trusted parameter "white list" through.
    def sample_type_params
      params.require(:sample_type).permit(:name, :data)
    end
end
