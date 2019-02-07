class MemoriesController < ApplicationController
def create
    @bar = Bar.find(params[:bar_id])
    @bar.memories.create(memories_params)
    redirect_to bar_path(@bar)
  end
  def destroy
    @bar = Bar.find(params[:bar_id])
    @memories = @bar.memories.find(params[:id])
    @memories.destroy
    redirect_to bar_path(@bar)
  end
  private
  def memories_params
    params.require(:memory).permit(:body)
  end

end
