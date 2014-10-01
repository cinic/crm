class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :set_landlords, only: [:new, :edit, :update, :create]
  before_action :set_realtors, only: [:new, :edit, :update, :create]

  def index
    @apartments = Apartment.all
  end

  def show
  end

  def new
    @apartment = Apartment.new
    @apartment.assets.build
  end

  def edit
  end

  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apartment }
      else
        format.html { render action: 'new' }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url }
      format.json { head :no_content }
    end
  end

  private
    def set_apartment
      @apartment = Apartment.find(params[:id])
      @apartment.assets.build if %w[edit show].include?(action_name)
    end

    def set_landlords
      @landlords = Landlord.all
    end

    def set_realtors
      @realtors = User.all
    end

    def apartment_params
      params.require(:apartment).permit!
    end
end