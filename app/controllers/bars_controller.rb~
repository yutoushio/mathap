class BarsController < ApplicationController
  def index
    @bars = Bar.all.order(created_at: 'desc')
  end

  def show
    @bar = Bar.find(params[:id])
  end
  def new
    @bar = Bar.new
  end
  def edit
    @bar = Bar.find(params[:id])
  end
  def update
    @bar = Bar.find(params[:id])
    if @bar.update(bar_params)
      redirect_to bar_path
    else
      render'edit'
    end
  end
  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to bars_path
  end
  def create
    #    render plain: params[:line].inspect
    @bar = Bar.new(bar_params)
    if @bar.save
      redirect_to bars_path
     else
      #render plain: @line.errors.inspect
      render 'new'
    end
  end

  private
  def bar_params
    params.require(:bar).permit(:title, :body)
  end
end
