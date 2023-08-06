class ListsController < ApplicationController

  before_action :set_list, only: %i(edit update)

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update
      redirect_to :root
    else
      render :edit
    end
  end

  def delete
    @list.destroy!
    redirect_to :root
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

  def set_list
    @list = List.find_by(id: params[:id])
  end
end
