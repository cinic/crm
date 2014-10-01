class Money::CategoriesController < ApplicationController
  before_action :set_money_category, only: [:show, :edit, :update, :destroy]

  def index
    @money_categories = Money::Category.all
  end

  def show
  end

  def new
    @money_category = Money::Category.new
  end

  def edit
  end

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

  def destroy
    @money_category.destroy
    respond_to do |format|
      format.html { redirect_to money_categories_url }
      format.json { head :no_content }
    end
  end

  private
    def set_money_category
      @money_category = Money::Category.find(params[:id])
    end

    def money_category_params
      params.require(:money_category).permit(:description)
    end
end
