class TestStatusesController < ApplicationController
  before_action :set_test_status, only: [:show, :edit, :update, :destroy]
  before_action :authorize_test_statuses, only: [:new, :create, :index]

  # GET /test_statuses
  def index
    @page = params[:page]
    @per_page = 10

    @test_statuses_filtered = params[:q].present? ? TestStatus.by_name(params[:q]) : TestStatus.all

    @test_statuses = @test_statuses_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @test_statuses.to_csv }
    end
  end

  # GET /test_statuses/1
  def show
  end

  # GET /test_statuses/new
  def new
    @test_status = TestStatus.new
  end

  # GET /test_statuses/1/edit
  def edit
  end

  # POST /test_statuses
  def create
    @test_status = TestStatus.new(test_status_params)

    if @test_status.save
      redirect_to @test_status
    else
      render :new
    end
  end

  # PATCH/PUT /test_statuses/1
  def update
    if @test_status.update(test_status_params)
      redirect_to @test_status
    else
      render :edit
    end
  end

  # DELETE /test_statuses/1
  def destroy
    if @test_status.destroy
      redirect_to test_statuses_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_status
      @test_status = TestStatus.find(params[:id])
      authorize @test_status
    end

    # Authorization for class.
    def authorize_test_statuses
      authorize TestStatus
    end

    # Only allow a trusted parameter "white list" through.
    def test_status_params
      params.require(:test_status).permit(:name)
    end
end
