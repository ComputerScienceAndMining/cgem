class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_users, only: [:new, :create, :index]

  # GET /users
  def index
    @page = params[:page]
    @per_page = 10

    @users_filtered = params[:q].present? ? User.by_name(params[:q]) : User.all

    @users = @users_filtered.paginate page: params[:page], per_page: @per_page

    # Display the data collected according to a format
    respond_to do |format|
      format.html
      format.json
      #format.csv { send_data @users.to_csv }
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(permitted_attributes(@user))

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    successfully_updated = if needs_update_password? @user, params
      same_user = current_user.id == @user.id
      @user.update(permitted_attributes(@user))
      sign_in(@user, bypass: true) if same_user
    else
      @user.update_without_password(permitted_attributes(@user).except(:current_password, :password, :password_confirmation))
    end

    if successfully_updated
      redirect_to @user, notice: t('success_on_resource_action',
                          scope: :crud_views,
                          resource: t('one', scope: [:activerecord, :models, :user]),
                          action: t('participle', scope: [:actions, :update]))
    else
        render :edit
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy
      redirect_to users_url
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    # Authorization for class.
    def authorize_users
      authorize User
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :enabled, :role, :password, :password_confirmation)
    end

    # Check if passwords needs to be updated
    def needs_update_password? user, params
      user.email != params[:user][:email] ||
        params[:user][:password].present? ||
        params[:user][:password_confirmation].present?
    end
end
