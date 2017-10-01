class SpecimenTypesController < ApplicationController
  before_action :set_specimen_type, only: [:show, :edit, :update, :destroy]
  before_action :authorize_specimen_types, only: [:new, :create, :index]

  # GET /specimen_types
  def index
    @page = params[:page]
    @per_page = 10

    @specimen_types_filtered = params[:q].present? ? SpecimenType.by_name(params[:q]) : SpecimenType.all

    @specimen_types = @specimen_types_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @specimen_types.to_csv }
    end
  end

  # GET /specimen_types/1
  def show
  end

  # GET /specimen_types/new
  def new
    @specimen_type = SpecimenType.new
  end

  # GET /specimen_types/1/edit
  def edit
  end

  # POST /specimen_types
  def create
    @specimen_type = SpecimenType.new(specimen_type_params)

    if @specimen_type.save
      redirect_to @specimen_type
    else
      render :new
    end
  end

  # PATCH/PUT /specimen_types/1
  def update
    if @specimen_type.update(specimen_type_params)
      redirect_to @specimen_type
    else
      render :edit
    end
  end

  # DELETE /specimen_types/1
  def destroy
    if @specimen_type.destroy
      redirect_to specimen_types_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specimen_type
      @specimen_type = SpecimenType.find(params[:id])
      authorize @specimen_type
    end

    # Authorization for class.
    def authorize_specimen_types
      authorize SpecimenType
    end

    # Only allow a trusted parameter "white list" through.
    def specimen_type_params
      params.require(:specimen_type).permit(:name, :data)
    end
end
