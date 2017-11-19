class TestTypesController < ApplicationController
  before_action :set_test_type, only: [:show, :edit, :update, :destroy]
  before_action :authorize_test_types, only: [:new, :create, :index]

  # GET /test_types
  def index
    @page = params[:page]
    @per_page = 10

    @test_types_filtered = params[:q].present? ? TestType.by_name(params[:q]) : TestType.all

    @test_types = @test_types_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @test_types.to_csv }
    end
  end

  # GET /test_types/1
  def show
    @test_type_versions = @test_type.test_type_versions
  end

  # GET /test_types/new
  def new
    @test_type = TestType.new
  end

  # GET /test_types/1/edit
  def edit
  end

  # POST /test_types
  def create
    @test_type = TestType.new(test_type_params)

    if @test_type.save
      redirect_to @test_type
    else
      render :new
    end
  end

  # PATCH/PUT /test_types/1
  def update
    if @test_type.update(test_type_params)
      redirect_to @test_type
    else
      render :edit
    end
  end

  # DELETE /test_types/1
  def destroy
    if @test_type.destroy
      redirect_to test_types_url
    else
      @test_type_versions = @test_type.test_type_versions
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_type
      @test_type = TestType.find(params[:id])
      authorize @test_type
    end

    # Authorization for class.
    def authorize_test_types
      authorize TestType
    end

    # Only allow a trusted parameter "white list" through.
    def test_type_params
      params.require(:test_type).permit(:name, :description, :data)
    end
end
