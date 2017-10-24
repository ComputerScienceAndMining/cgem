class LabTestsController < ApplicationController
  before_action :set_work_order
  before_action :set_lab_test, only: [:show, :edit, :update, :destroy]
  before_action :authorize_lab_tests, only: [:new, :create, :index]

  # GET /lab_tests
  def index
    if request.format.xls?
      @sheets = LabTest.to_xls(@work_order)
    else
      @page = params[:page]
      @per_page = 10
      @lab_tests_filtered = params[:q].present? ? LabTest.by_name(params[:q]) : LabTest.all
      @lab_tests = @lab_tests_filtered.paginate page: params[:page], per_page: @per_page
    end

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      format.xls
      #format.csv { send_data @lab_tests.to_csv }
    end
  end

  # GET /lab_tests/1
  def show
  end

  # GET /lab_tests/new
  def new
    @lab_test = params["lab_test"] ? LabTest.new(lab_test_params) : LabTest.new
  end

  # GET /lab_tests/1/edit
  def edit
  end

  # POST /lab_tests
  def create
    @lab_test = LabTest.new(lab_test_params)
    @lab_test.work_order = @work_order

    if @lab_test.save
      redirect_to [@work_order, @lab_test]
    else
      render :new
    end
  end

  # PATCH/PUT /lab_tests/1
  def update
    if @lab_test.update(lab_test_params)
      redirect_to [@work_order, @lab_test]
    else
      render :edit
    end
  end

  # DELETE /lab_tests/1
  def destroy
    if @lab_test.destroy
      redirect_to work_order_lab_tests_url(@work_order)
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

    def set_lab_test
      @lab_test = LabTest.find(params[:id])
      authorize @lab_test
    end

    # Authorization for class.
    def authorize_lab_tests
      authorize LabTest
    end

    # Only allow a trusted parameter "white list" through.
    def lab_test_params
      params.require(:lab_test).permit(:name, :description, :started_at, :ended_at, :work_order_id, :test_status_id, :test_type_id, :test_type_version_id, :specimen_id, :tested_by_id, :data)
    end
end
