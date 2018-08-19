class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
      @user = User.find(params[:id])
          unless current_user.teacher?
                  unless @user == current_user
                      redirect_to root_path, :alert => "Access denied."
          end
      @user.gh_user = GH_User.find(params[:id])
          unless @user.gh_user == current_user 
                  unless @user.gh_user == nil 
                      redirect_to root_path, :alert => "Access denied"
          end
      end
    #include to make http request from controller 
    require 'net/http'
    # raw url for external api
    @url = 'https://api.github.com/user/#{@user}'
    @rurl = 'https://api.github.com/user/#{@user}/repos'
    # turn your URL into a URI
    @uri = URI(@url)
    # Send and collect the data from an http request to the URI
    @response = Net::HTTP.get(@uri)
    # Parse the JSON response
    # GO TOVIEW TO USE API DATA
    @data = JSON.parse(@response) # <img src=<%= @avatar_url%> />
    @repos = JSON.parse(@rurl) # inside view -> <%= @repos.each do |r| %>
    @organizations_url = JSON.parse(@organizations_url.each)
    # Coins is specific to this app and not necessary for simply calling an API
#     @avatar_url = <img src= <%= @user.avatar_url %> />
    @avatar_url = @data.avatar_url
    
    end
  end

    
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
