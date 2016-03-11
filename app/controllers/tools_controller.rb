class ToolsController < ApplicationController

  def edit
    @tool = Tool.new.find(params[:id])
  end

  def tools
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = 'Tool was created successfully!'
      redirect_to tool_path(@tool.id)
    else
      render :new
    end
  end

  def update
    @tool = Tool.new(tool_params)
    if @tool.update(tool_params)
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end
  end

  def random_tool
    offset = rand(Model.count)

    @tool = Tool.offset(offset).first
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
