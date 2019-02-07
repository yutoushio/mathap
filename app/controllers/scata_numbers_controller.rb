class ScataNumbersController < ApplicationController
  def create
    @scatter = Scatter.find(params[:scatter_id])
    @scatter.scata_numbers.create(scatter_number_params)
    redirect_to scatter_path(@scatter)
  end
  def destroy
    @scatter = Scatter.find(params[:scatter_id])
    @scata_number = @scatter.scata_numbers.find(params[:id])
    @scata_number.destroy
    redirect_to scatter_path(@scatter)
  end
  private
  def scatter_number_params
    params.require(:scata_number).permit(:number)
  end


end
