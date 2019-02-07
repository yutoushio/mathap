class ScatNumbersController < ApplicationController
  def create
    @scatter = Scatter.find(params[:scatter_id])
    @scatter.scat_numbers.create(scatter_number_params)
    redirect_to scatter_path(@scatter)
  end
  def destroy
    @scatter = Scatter.find(params[:scatter_id])
    @scat_number = @scatter.scat_numbers.find(params[:id])
    @scat_number.destroy
    redirect_to scatter_path(@scatter)
  end
  private
  def scatter_number_params
    params.require(:scat_number).permit(:number)
  end

end
