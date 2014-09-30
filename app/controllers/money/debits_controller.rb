class Money::DebitsController < ApplicationController
  before_action :set_money_debit, only: [:show, :edit, :update, :destroy]

  # GET /money/debits
  # GET /money/debits.json
  def index
    @money_debits = Money::Debit.all
  end

  # GET /money/debits/1
  # GET /money/debits/1.json
  def show
  end

  # GET /money/debits/new
  def new
    @money_debit = Money::Debit.new
  end

  # GET /money/debits/1/edit
  def edit
  end

  # POST /money/debits
  # POST /money/debits.json
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

  # PATCH/PUT /money/debits/1
  # PATCH/PUT /money/debits/1.json
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

  # DELETE /money/debits/1
  # DELETE /money/debits/1.json
  def destroy
    @money_debit.destroy
    respond_to do |format|
      format.html { redirect_to money_root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_debit
      @money_debit = Money::Debit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def money_debit_params
      params.require(:money_debit).permit(:contractor, :category_id, :amount, :date, :status_id, :description, :deal_id, :user_id)
    end
end
