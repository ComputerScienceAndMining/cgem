class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:edit, :update, :destroy]
  before_action :authorize_work_orders, only: [:new, :create, :index]

  # GET /work_orders
  def index
    @page = params[:page]
    @per_page = 10

    @work_orders_filtered = params[:q].present? ? policy_scope(WorkOrder).by_name(params[:q]) : policy_scope(WorkOrder).all
    @work_orders = @work_orders_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @work_orders.to_csv }
    end
  end

  # GET /work_orders/1
  def show
    @work_order = WorkOrder
                    .includes(samples: [:specimens, {lab_tests: [:test_type_version, :test_status]}])
                    .find(params[:id])
  end

  # GET /work_orders/new
  def new
    @work_order = WorkOrder.new
  end

  # GET /work_orders/1/edit
  def edit
  end

  # POST /work_orders
  def create
    @work_order = WorkOrder.new(work_order_params)

    if @work_order.save
      redirect_to @work_order
    else
      render :new
    end
  end

  # PATCH/PUT /work_orders/1
  def update
    if @work_order.update(work_order_params)
      redirect_to @work_order
    else
      render :edit
    end
  end

  # DELETE /work_orders/1
  def destroy
    if @work_order.destroy
      redirect_to work_orders_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
      authorize @work_order
    end

    # Authorization for class.
    def authorize_work_orders
      authorize WorkOrder
    end

    # Only allow a trusted parameter "white list" through.
    def work_order_params
      params.require(:work_order).permit(:name, :description, :due_date, :responsible_id, :work_order_status_id, :organisation_id)
    end
end
