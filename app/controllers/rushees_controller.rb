class RusheesController < ApplicationController
  def index
    render locals: { rushees: Rushee.all }
  end

  def search

  end

  def new
    render locals: { rushee: Rushee.new }
  end

  def edit
    render locals: { rushee: Rushee.find(params[:id]) }
  end

  def update
    rushee = Rushee.find(params[:id])
    rushee.update_attributes(rushee_params)
    if rushee.errors.any?
      redirect_to :edit
    else
      redirect_to rushee
    end
  end

  def create
    rushee = Rushee.create(rushee_params)
    if rushee.errors.any?
      flash[:error] = rushee.errors.full_messages.first
      redirect_to :back
    else
      redirect_to rushee
    end
  end

  def show
    render locals: { rushee: Rushee.find(params[:id]) }
  end

  private

  def rushee_params
    params.require(:rushee).permit(*Rushee::PERMITTED_ATTRIBUTES)
  end
end
