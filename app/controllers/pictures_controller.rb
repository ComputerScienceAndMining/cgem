class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :authorize_pictures, only: [:new, :create, :index]

  # GET /pictures
  def index
    @page = params[:page]
    @per_page = 10

    @pictures_filtered = params[:q].present? ? Picture.by_name(params[:q]) : Picture.all

    @pictures = @pictures_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @pictures.to_csv }
    end
  end

  # GET /pictures/1
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to @picture
    else
      render :new
    end
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      redirect_to @picture
    else
      render :edit
    end
  end

  # DELETE /pictures/1
  def destroy
    if @picture.destroy
      redirect_to pictures_url
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
      authorize @picture
    end

    # Authorization for class.
    def authorize_pictures
      authorize Picture
    end

    # Only allow a trusted parameter "white list" through.
    def picture_params
      params.require(:picture).permit(:local_id, :sample_id, :specimen_id, :lab_test_id)
    end
end
