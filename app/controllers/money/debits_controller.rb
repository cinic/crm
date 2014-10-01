class Money::DebitsController < ApplicationController
  before_action :set_money_debit, only: [:show, :edit, :update, :destroy]

  def index
    @money_debits = Money::Debit.all
  end

  def show
  end

  def new
    @money_debit = Money::Debit.new
  end

  def edit
  end

  def create
    @money_debit = Money::Debit.new(money_debit_params)

    respond_to do |format|
      if @money_debit.save
        format.html { redirect_to money_root_url, notice: 'Debit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @money_debit }
      else
        format.html { render action: 'new' }
        format.json { render json: @money_debit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @money_debit.update(money_debit_params)
        format.html { redirect_to money_root_url, notice: 'Debit was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @money_debit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @money_debit.destroy
    respond_to do |format|
      format.html { redirect_to money_root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_money_debit
      @money_debit = Money::Debit.find(params[:id])
    end

    def money_debit_params
      params.require(:money_debit).permit(:contractor, :category_id, :amount, :date, :status_id, :description, :deal_id, :user_id)
    end
end
