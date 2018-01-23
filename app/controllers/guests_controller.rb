class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :update, :destroy]

  # GET /guests
  def index
    @guests = Guest.all
    render json: @guests.to_json(include: :rsvp)
  end

  # GET /guests/1
  def show
    render json: @guest
  end

  # POST /guests
  def create
    @guest = Guest.new(guest_params)
    @guest.rsvp_id = params[:rsvp_id]

    if @guest.save
      render json: @guest, status: :created
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guests/1
  def update
    if @guest.update(guest_params)
      render json: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guests/1
  def destroy
    @guest.destroy
  end

  def attending
    @guests = Guest.where('attending': true)
    render json: @guests.to_json(include: :rsvp)
  end

  def notAttending
    @guests = Guest.where('attending': false)
    render json: @guests.to_json(include: :rsvp)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def guest_params
      params.require(:guest).permit(:name, :entree, :attending)
    end
end
