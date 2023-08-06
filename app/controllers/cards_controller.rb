class CardsController < ApplicationController

  before_action :set_card, only: %i(show edit update destroy)
  
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @card = Card.find_by(id: params[:id])
  end

  def edit
  end

  def update
    if @card.update
      redirect_to :root
    else
      render :edit
    end
  end
  
  def destroy
    @card.destroy!
    redirect_to :root
  end

  private

  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end

  def set_card
    @card = Card.find_by(id: params[:id])
  end
end
