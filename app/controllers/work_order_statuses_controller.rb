class WorkOrderStatusesController < ApplicationController
  before_action :set_work_order_status, only: [:show, :edit, :update, :destroy]
  before_action :authorize_work_order_statuses, only: [:new, :create, :index]

  # GET /work_order_statuses
  def index
    @page = params[:page]
    @per_page = 10

    @work_order_statuses_filtered = params[:q].present? ? WorkOrderStatus.by_name(params[:q]) : WorkOrderStatus.all

    @work_order_statuses = @work_order_statuses_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @work_order_statuses.to_csv }
    end
  end

  # GET /work_order_statuses/1
  def show
  end

  # GET /work_order_statuses/new
  def new
    @work_order_status = WorkOrderStatus.new
  end

  # GET /work_order_statuses/1/edit
  def edit
  end

  # POST /work_order_statuses
  def create
    @work_order_status = WorkOrderStatus.new(work_order_status_params)

    if @work_order_status.save
      redirect_to @work_order_status
    else
      render :new
    end
  end

  # PATCH/PUT /work_order_statuses/1
  def update
    if @work_order_status.update(work_order_status_params)
      redirect_to @work_order_status
    else
      render :edit
    end
  end

  # DELETE /work_order_statuses/1
  def destroy
    if @work_order_status.destroy
      redirect_to work_order_statuses_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order_status
      @work_order_status = WorkOrderStatus.find(params[:id])
      authorize @work_order_status
    end

    # Authorization for class.
    def authorize_work_order_statuses
      authorize WorkOrderStatus
    end

    # Only allow a trusted parameter "white list" through.
    def work_order_status_params
      params.require(:work_order_status).permit(:name)
    end
end
