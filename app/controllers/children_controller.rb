class ChildrenController < ApplicationController
  def index
    @cars = Car.all
  end 
end 