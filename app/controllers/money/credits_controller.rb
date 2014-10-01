class Money::CreditsController < ApplicationController
  before_action :set_money_credit, only: [:show, :edit, :update, :destroy]

  def index
    @money_credits = Money::Credit.all
  end

  def show
    respond_to do |format|
      format.js {}
    end
  end

  def new
    @money_credit = Money::Credit.new
  end

  def edit
  end

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

  def update
    respond_to do |format|
      if @money_credit.update(money_credit_params)
        format.html { redirect_to money_root_url, notice: 'Credit was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.js   { render js: @money_credit.errors, status: :unprocessable_entity }
        format.json { render json: @money_credit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @money_credit.destroy
    respond_to do |format|
      format.html { redirect_to money_root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_money_credit
      @money_credit = Money::Credit.find(params[:id])
    end

    def money_credit_params
      params.require(:money_credit).permit(:contractor, :category_id, :amount, :date, :status_id, :description, :deal_id, :user_id)
    end
end
