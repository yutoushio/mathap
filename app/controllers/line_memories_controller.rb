class LineMemoriesController < ApplicationController
def create
    @line = Line.find(params[:line_id])
    @line.line_memories.create(line_memories_params)
    redirect_to line_path(@line)
  end
  def destroy
    @line = Line.find(params[:line_id])
    @line_memories = @line.line_memories.find(params[:id])
    @line_memories.destroy
    redirect_to line_path(@line)
  end
  private
  def line_memories_params
    params.require(:line_memory).permit(:body)
  end
end
