class LinesController < ApplicationController
  
  def index
    @lines = Line.all 
    redirect_to root_path, notice: 'There are no lines yet!'  if @lines.empty?
  end

  private

  def line_params
    params.require(:line).permit( :name, :status)
  end
end