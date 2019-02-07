class LinesController < ApplicationController
  def index
    @lines = Line.all.order(created_at: 'desc')
  end

  def show
    @line = Line.find(params[:id])
  end
  def new
    @line = Line.new
  end
  def edit
    @line = Line.find(params[:id])
  end
  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      redirect_to line_path
    else
      render'edit'
    end
  end
  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    redirect_to lines_path
  end
  def create
    #    render plain: params[:line].inspect
    @line = Line.new(line_params)
    if @line.save
      redirect_to lines_path
     else
      #render plain: @line.errors.inspect
      render 'new'
    end
  end

  private
  def line_params
    params.require(:line).permit(:title, :body)
  end
end
