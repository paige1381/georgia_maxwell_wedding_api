class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_user, except: [:login, :create, :index]

  # GET /users
  def index
    @users = User.all

    render json: @users.to_json(include: :rsvps)
  end

  # GET /users/1
  def show
    render json: get_current_user.to_json(include: :rsvps)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    p 'starting login'
    user = User.find_by(username: params[:user][:username])
    p user
    if user && user.authenticate(params[:user][:password])
      p user.id
      p user.username
      token = create_token(user.id, user.username)
      p token
      render json: { status: 200, token: token, user: user }
    else
      render json: user.errors, status: :unauthorized
    end
  end

  private
    def create_token(id, username)
      p 'create_token function'
      p id
      p username
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
      p 'payload function'
      p id
      p username
      p (Time.now + 30.minutes).to_i
      p Time.now.to_i
      p ENV['JWT_ISSUER']
      {
        exp: (Time.now + 30.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password)
    end

end
