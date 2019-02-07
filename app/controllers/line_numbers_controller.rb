class LineNumbersController < ApplicationController
  def create
    @line = Line.find(params[:line_id])
    @line.line_numbers.create(line_number_params)
    redirect_to line_path(@line)
  end
  def destroy
    @line = Line.find(params[:line_id])
    @line_number = @line.line_numbers.find(params[:id])
    @line_number.destroy
    redirect_to line_path(@line)
  end
  private
  def line_number_params
    params.require(:line_number).permit(:number)
  end
end
