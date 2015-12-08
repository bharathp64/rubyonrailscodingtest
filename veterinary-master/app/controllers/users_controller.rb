class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @user = User.new
    @roles = Role.roles
    @profile = @user.build_profile
    @address = @user.build_address
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /roles/1/edit
  def edit
    @user = User.find(params[:id])
    @roles = Role.roles
    @profile = @user.profile ? @user.profile : @user.build_profile
    @address = @user.address ? @user.address : @user.build_address
    
  end

  # POST /roles
  # POST /roles.json
  def create
    @user = User.new(params[:user])
    @roles = Role.roles
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
  
  def check_admin
    unless current_user.admin?
      redirect_to root_url
    end
  end
end
