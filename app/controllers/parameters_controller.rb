class ParametersController < ApplicationController
  before_action :set_parameter, only: [:show, :edit, :update, :destroy]
  before_action :authorize_parameters, only: [:new, :create, :index]

  # GET /parameters
  def index
    @page = params[:page]
    @per_page = 10

    @parameters_filtered = params[:q].present? ? Parameter.by_name(params[:q]) : Parameter.all

    @parameters = @parameters_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @parameters.to_csv }
    end
  end

  # GET /parameters/1
  def show
  end

  # GET /parameters/new
  def new
    @parameter = Parameter.new
  end

  # GET /parameters/1/edit
  def edit
  end

  # POST /parameters
  def create
    @parameter = Parameter.new(parameter_params)

    if @parameter.save
      redirect_to @parameter
    else
      render :new
    end
  end

  # PATCH/PUT /parameters/1
  def update
    if @parameter.update(parameter_params)
      redirect_to @parameter
    else
      render :edit
    end
  end

  # DELETE /parameters/1
  def destroy
    if @parameter.destroy
      redirect_to parameters_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter
      @parameter = Parameter.find(params[:id])
      authorize @parameter
    end

    # Authorization for class.
    def authorize_parameters
      authorize Parameter
    end

    # Only allow a trusted parameter "white list" through.
    def parameter_params
      params.require(:parameter).permit(:key, :value)
    end
end
