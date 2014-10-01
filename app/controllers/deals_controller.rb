class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  before_action :set_deal_relations, only: [:new, :edit, :update, :create]

  def index
    @deals = Deal.all
  end

  def show
  end

  def new
    @deal = Deal.new
  end

  def edit
  end

  def create
    @deal = Deal.new(deal_params)
    # change to DJ
    @money = Money::Debit.new(
                              amount: @deal.commission,
                              contractor: @deal.tenant.name,
                              category_id: '5', 
                              status_id: '2',
                              date: Time.zone.now,
                              description: 'Сдача в аренду объекта #' + @deal.apartment_id.to_s
                              )
    respond_to do |format|
      if @deal.save
        @money.save!
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @deal }
      else
        format.html { render action: 'new' }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end

  private
    def set_deal
      @deal = Deal.find(params[:id])
    end
    
    def set_deal_relations
      @landlords = Landlord.all
      @tenants = Tenant.all
      @realtors = User.realtors
      @apartments = Apartment.all
    end

    def deal_params
      params.require(:deal).permit!
    end
end
