class DashboardsController < ApplicationController
  def index
    @dojos = Dashboard.all
  end

  def new
  end

  def show
    @dojo = Dashboard.find(params[:id])
  end

  def edit
    @dojo = Dashboard.find(params[:id])
  end

  def update
    @dojo = Dashboard.find(params[:id])

    if @dojo.update(dashboard_params)
      redirect_to root_path, notice: "You have successfully updated a Dojo!"
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Dashboard.destroy(params[:id])
    redirect_to root_url
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
