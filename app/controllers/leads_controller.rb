class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :edit_realtor, :new_landlord_lead, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # GET /leads/1/edit_realtor
  def edit_realtor
    @realtors = User.realtors
  end

  # GET /leads/1/new_landlord_lead
  def new_landlord_lead
    landlord = @lead.build_landlord({name: @lead.name, mobile: @lead.mobile})

    respond_to do |format|
      if @lead.save
        format.html { redirect_to landlord, notice: 'Landlord was successfully created.' }
        format.json { render action: 'show', status: :created, location: landlord }
      else
        format.html { render action: 'new' }
        format.json { render json: landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    @lead.status = 0

    respond_to do |format|
      if @lead.save
        format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lead }
      else
        format.html { render action: 'new' }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:name, :mobile, :metro, :address, :status, :user_id, :landlord_id)
    end
end
