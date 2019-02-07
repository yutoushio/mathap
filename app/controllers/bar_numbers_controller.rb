class BarNumbersController < ApplicationController
def create
    @bar = Bar.find(params[:bar_id])
    @bar.bar_numbers.create(bar_number_params)
    redirect_to bar_path(@bar)
  end
  def destroy
    @bar = Bar.find(params[:bar_id])
    @bar_number = @bar.bar_numbers.find(params[:id])
    @bar_number.destroy
    redirect_to bar_path(@bar)
  end
  private
  def bar_number_params
    params.require(:bar_number).permit(:number)
  end

end
