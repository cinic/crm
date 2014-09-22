class Money::IndexController < ApplicationController
  def index
    @money = Money::Operation.all
  end
end
