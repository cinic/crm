class Money::CreditsController < ApplicationController
  before_action :set_money_credit, only: [:show, :edit, :update, :destroy]

  # GET /money/credits
  # GET /money/credits.json
  def index
    @money_credits = Money::Credit.all
  end

  # GET /money/credits/1
  # GET /money/credits/1.json
  def show
    respond_to do |format|
      format.js {}
    end
  end

  # GET /money/credits/new
  def new
    @money_credit = Money::Credit.new
  end

  # GET /money/credits/1/edit
  def edit
  end

  # POST /money/credits
  # POST /money/credits.json
  def create
    @money_credit = Money::Credit.new(money_credit_params)

    respond_to do |format|
      if @money_credit.save
        format.html { redirect_to money_root_url, notice: 'Credit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @money_credit }
      else
        format.html { render action: 'new' }
        format.json { render json: @money_credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money/credits/1
  # PATCH/PUT /money/credits/1.json
  def update
    respond_to do |format|
      if @money_credit.update(money_credit_params)
        format.html { redirect_to money_root_url, notice: 'Credit was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @money_credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money/credits/1
  # DELETE /money/credits/1.json
  def destroy
    @money_credit.destroy
    respond_to do |format|
      format.html { redirect_to money_root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_credit
      @money_credit = Money::Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def money_credit_params
      params.require(:money_credit).permit(:contractor, :category_id, :amount, :date, :status_id, :description, :deal_id, :user_id)
    end
end
