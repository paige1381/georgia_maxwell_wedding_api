class WelcomeController < ApplicationController
  def index
    render json: { status: 200, message: "Wedding API" }
  end
end
