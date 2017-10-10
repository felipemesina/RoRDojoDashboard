class DashboardsController < ApplicationController
  def index
    @dojos = Dashboard.all
  end
end
