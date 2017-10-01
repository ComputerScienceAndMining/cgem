class TestTypeVersionsController < ApplicationController
  before_action :set_test_type_version, only: [:show, :edit, :update, :destroy]
  before_action :authorize_test_type_versions, only: [:new, :create, :index]

  # GET /test_type_versions
  def index
    @page = params[:page]
    @per_page = 10

    @test_type_versions_filtered = params[:q].present? ? TestTypeVersion.by_name(params[:q]) : TestTypeVersion.all

    @test_type_versions = @test_type_versions_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @test_type_versions.to_csv }
    end
  end

  # GET /test_type_versions/1
  def show
  end

  # GET /test_type_versions/new
  def new
    @test_type_version = TestTypeVersion.new
  end

  # GET /test_type_versions/1/edit
  def edit
  end

  # POST /test_type_versions
  def create
    @test_type_version = TestTypeVersion.new(test_type_version_params)

    if @test_type_version.save
      redirect_to @test_type_version
    else
      render :new
    end
  end

  # PATCH/PUT /test_type_versions/1
  def update
    if @test_type_version.update(test_type_version_params)
      redirect_to @test_type_version
    else
      render :edit
    end
  end

  # DELETE /test_type_versions/1
  def destroy
    if @test_type_version.destroy
      redirect_to test_type_versions_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_type_version
      @test_type_version = TestTypeVersion.find(params[:id])
      authorize @test_type_version
    end

    # Authorization for class.
    def authorize_test_type_versions
      authorize TestTypeVersion
    end

    # Only allow a trusted parameter "white list" through.
    def test_type_version_params
      params.require(:test_type_version).permit(:name, :description, :data, :test_type_id)
    end
end
