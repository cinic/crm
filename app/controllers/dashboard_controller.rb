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
        lost: Apartment.lost.count
      }
    end

    def set_deals
      @deals = {
        this_month: Deal.this_month.count,
        all: Deal.all.count
      }
    end
end