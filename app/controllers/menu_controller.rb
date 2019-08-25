class MenuController < ApplicationController
  def new
    @meals = current_user.meals.all.shuffle.take(7)
  end
end
