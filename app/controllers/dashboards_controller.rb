class DashboardsController < ApplicationController
  def index
    @dojos = Dashboard.all
  end

  def new
  end

  def create
    @dojo = Dashboard.new(dashboard_params)

    if @dojo.save
      redirect_to root_url, notice: "You have successfully created a Dojo!"
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to :back
  end
end

  private
    def dashboard_params
      params.require(:dashboard).permit(:branch, :street, :city, :state)
    end


end
