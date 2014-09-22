class Money::StatusesController < ApplicationController
  before_action :set_money_status, only: [:show, :edit, :update, :destroy]

  # GET /money_statuses
  # GET /money_statuses.json
  def index
    @money_statuses = Money::Status.all
  end

  # GET /money_statuses/1
  # GET /money_statuses/1.json
  def show
  end

  # GET /money_statuses/new
  def new
    @money_status = Money::Status.new
  end

  # GET /money_statuses/1/edit
  def edit
  end

  # POST /money_statuses
  # POST /money_statuses.json
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

  # PATCH/PUT /money_statuses/1
  # PATCH/PUT /money_statuses/1.json
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

  # DELETE /money_statuses/1
  # DELETE /money_statuses/1.json
  def destroy
    @money_status.destroy
    respond_to do |format|
      format.html { redirect_to money_statuses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_status
      @money_status = Money::Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def money_status_params
      params.require(:money_status).permit(:description)
    end
end
