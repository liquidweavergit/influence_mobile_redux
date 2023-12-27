class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_non_admins
  before_action :set_user, only: %i[ show edit update destroy ]

  # users
  # GET    /users(.:format)
  # users#index
  def index
    @users = User.all.paginate(page: params[:page], per_page: 25)
  end

  # user
  # GET    /users/:id(.:format)
  # users#show
  def show
  end

  # new_user
  # GET    /users/new(.:format)
  # users#new
  def new
    @user = User.new
  end

  # users
  # POST   /users(.:format)
  # users#create
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # edit_user
  # GET    /users/:id/edit(.:format)
  # users#edit
  def edit

  end

  # user
  # PATCH  /users/:id(.:format)
  # PUT    /users/:id(.:format)
  # users#update
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # user
  # DELETE /users/:id(.:format)
  # users#destroy
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to offers_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :username, :email, :birthdate, :gender,
                                   :password, :password_confirmation)
  end
end
