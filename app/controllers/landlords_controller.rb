class LandlordsController < ApplicationController
  before_action :set_landlord, only: [:show, :edit, :update, :destroy, :new_landlord_wizard, :wizard_step_2, :wizard_step_3, :wizard_step_4, :save_wizard_step_1, :save_wizard_step_2, :save_wizard_step_3, :save_wizard_step_4]

  # GET /landlords
  # GET /landlords.json
  def index
    @landlords = Landlord.all
  end

  # GET /landlords/1
  # GET /landlords/1.json
  def show
  end

  # GET /landlords/new
  def new
    @landlord = Landlord.new
  end

  # GET /landlords/1/edit
  def edit
  end

  def new_landlord_wizard
  end

  def new_without_lead
    @landlord = Landlord.new
  end

  def wizard_step_2
    @apartment = @landlord.apartments.new
  end
  def wizard_step_3
    @apartment = @landlord.apartments.last
  end

  def wizard_step_4
    @apartment = @landlord.apartments.last
    @realtors = User.realtors
  end

  # POST /landlords
  # POST /landlords.json
  def create
    @landlord = Landlord.new(landlord_params)

    respond_to do |format|
      if @landlord.save
        format.html { redirect_to @landlord, notice: 'Landlord was successfully created.' }
        format.json { render action: 'show', status: :created, location: @landlord }
      else
        format.html { render action: 'new' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landlords/1
  # PATCH/PUT /landlords/1.json
  def update
    respond_to do |format|
      if @landlord.update(landlord_params)
        format.html { redirect_to @landlord, notice: 'Landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_wizard_step_0
    @landlord = Landlord.new(landlord_params)
    respond_to do |format|
      if @landlord.save(landlord_params)
        format.html { redirect_to landlord_wizard_step_2_path(@landlord), notice: 'Landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new_without_lead' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end
  def save_wizard_step_1
    respond_to do |format|
      if @landlord.update(landlord_params)
        format.html { redirect_to landlord_wizard_step_2_path, notice: 'Landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new_landlord_wizard' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end
  def save_wizard_step_2
    @apartment = @landlord.apartments.new(apartment_params)
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to landlord_wizard_step_3_path, notice: 'Landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'wizard_step_2' }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end
  def save_wizard_step_3
    respond_to do |format|
      if @landlord.apartments.last.update(apartment_params)
        format.html { redirect_to landlord_wizard_step_4_path, notice: 'Landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'wizard_step_3' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end
  def save_wizard_step_4
    respond_to do |format|
      if @landlord.apartments.last.update(apartment_params)
        format.html { redirect_to @landlord.apartments.last, notice: 'Landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'wizard_step_4' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landlords/1
  # DELETE /landlords/1.json
  def destroy
    @landlord.destroy
    respond_to do |format|
      format.html { redirect_to landlords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landlord_params
      params.require(:landlord).permit!
    end
    def apartment_params
      params.require(:apartment).permit!
    end
end
