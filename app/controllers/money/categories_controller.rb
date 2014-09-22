class Money::CategoriesController < ApplicationController
  before_action :set_money_category, only: [:show, :edit, :update, :destroy]

  # GET /money_categories
  # GET /money_categories.json
  def index
    @money_categories = Money::Category.all
  end

  # GET /money_categories/1
  # GET /money_categories/1.json
  def show
  end

  # GET /money_categories/new
  def new
    @money_category = Money::Category.new
  end

  # GET /money_categories/1/edit
  def edit
  end

  # POST /money_categories
  # POST /money_categories.json
  def create
    @money_category = Money::Category.new(money_category_params)

    respond_to do |format|
      if @money_category.save
        format.html { redirect_to @money_category, notice: 'Money category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @money_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @money_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money_categories/1
  # PATCH/PUT /money_categories/1.json
  def update
    respond_to do |format|
      if @money_category.update(money_category_params)
        format.html { redirect_to @money_category, notice: 'Money category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @money_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money_categories/1
  # DELETE /money_categories/1.json
  def destroy
    @money_category.destroy
    respond_to do |format|
      format.html { redirect_to money_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_category
      @money_category = Money::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def money_category_params
      params.require(:money_category).permit(:description)
    end
end
