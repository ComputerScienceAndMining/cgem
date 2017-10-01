class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_organisations, only: [:new, :create, :index]

  # GET /organisations
  def index
    @page = params[:page]
    @per_page = 10

    @organisations_filtered = params[:q].present? ? Organisation.by_name(params[:q]) : Organisation.all

    @organisations = @organisations_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @organisations.to_csv }
    end
  end

  # GET /organisations/1
  def show
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations
  def create
    @organisation = Organisation.new(organisation_params)

    if @organisation.save
      redirect_to @organisation
    else
      render :new
    end
  end

  # PATCH/PUT /organisations/1
  def update
    if @organisation.update(organisation_params)
      redirect_to @organisation
    else
      render :edit
    end
  end

  # DELETE /organisations/1
  def destroy
    if @organisation.destroy
      redirect_to organisations_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
      authorize @organisation
    end

    # Authorization for class.
    def authorize_organisations
      authorize Organisation
    end

    # Only allow a trusted parameter "white list" through.
    def organisation_params
      params.require(:organisation).permit(:name)
    end
end
