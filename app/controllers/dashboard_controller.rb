class DashboardController < ApplicationController
  before_action :set_apartments, :set_deals, only: [:index]
  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Задаём переменные в виде хэшэй на будущее
    def set_apartments
      @apartments = {
        newest: Apartment.newest.count,
        all: Apartment.all.count,
        lost: Apartment.lost.count,
        advertised: Apartment.advertised.count
      }
    end

    def set_deals
      @deals = {
        this_month: Deal.this_month.count,
        all: Deal.all.count,
        all_money: Deal.all_money,
        this_month_money: Deal.this_month_money
      }
    end
end