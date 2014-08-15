class WizardLandlordsController < ApplicationController
  before_action :set_wizard_landlord, only: [:show, :edit, :update, :destroy]

  # GET /wizard_landlords
  # GET /wizard_landlords.json
  def index
    @wizard_landlords = WizardLandlord.all
  end

  # GET /wizard_landlords/1
  # GET /wizard_landlords/1.json
  def show
  end

  # GET /wizard_landlords/new
  def new
    @wizard_landlord = WizardLandlord.new
  end

  # GET /wizard_landlords/1/edit
  def edit
  end

  # POST /wizard_landlords
  # POST /wizard_landlords.json
  def create
    @wizard_landlord = WizardLandlord.new(wizard_landlord_params)

    respond_to do |format|
      if @wizard_landlord.save
        format.html { redirect_to @wizard_landlord, notice: 'Wizard landlord was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wizard_landlord }
      else
        format.html { render action: 'new' }
        format.json { render json: @wizard_landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wizard_landlords/1
  # PATCH/PUT /wizard_landlords/1.json
  def update
    respond_to do |format|
      if @wizard_landlord.update(wizard_landlord_params)
        format.html { redirect_to @wizard_landlord, notice: 'Wizard landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wizard_landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wizard_landlords/1
  # DELETE /wizard_landlords/1.json
  def destroy
    @wizard_landlord.destroy
    respond_to do |format|
      format.html { redirect_to wizard_landlords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wizard_landlord
      @wizard_landlord = WizardLandlord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wizard_landlord_params
      params[:wizard_landlord]
    end
end
