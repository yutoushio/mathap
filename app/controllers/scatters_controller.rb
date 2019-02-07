class ScattersController < ApplicationController
def index
    @scatters = Scatter.all.order(created_at: 'desc')
  end

  def show
    @scatter = Scatter.find(params[:id])
  end
  def new
    @scatter = Scatter.new
  end
  def edit
    @scatter = Scatter.find(params[:id])
  end
  def update
    @scatter = Scatter.find(params[:id])
    if @scatter.update(scatter_params)
      redirect_to scatter_path
    else
      render'edit'
    end
  end
  def destroy
    @scatter = Scatter.find(params[:id])
    @scatter.destroy
    redirect_to scatters_path
  end
  def create
    #    render plain: params[:scatter].inspect
    @scatter = Scatter.new(scatter_params)
    if @scatter.save
      redirect_to scatters_path
     else
      #render plain: @scatter.errors.inspect
      render 'new'
    end
  end
  private
  def scatter_params
    params.require(:scatter).permit(:title, :body)
  end

end
