class Money::StatusesController < ApplicationController
  before_action :set_money_status, only: [:show, :edit, :update, :destroy]

  def index
    @money_statuses = Money::Status.all
  end

  def show
  end

  def new
    @money_status = Money::Status.new
  end

  def edit
  end

  def create
    @money_status = Money::Status.new(money_status_params)

    respond_to do |format|
      if @money_status.save
        format.html { redirect_to @money_status, notice: 'Money status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @money_status }
      else
        format.html { render action: 'new' }
        format.json { render json: @money_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @money_status.update(money_status_params)
        format.html { redirect_to @money_status, notice: 'Money status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @money_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @money_status.destroy
    respond_to do |format|
      format.html { redirect_to money_statuses_url }
      format.json { head :no_content }
    end
  end

  private
    def set_money_status
      @money_status = Money::Status.find(params[:id])
    end

    def money_status_params
      params.require(:money_status).permit(:description)
    end
end
