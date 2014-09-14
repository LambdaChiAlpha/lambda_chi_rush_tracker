class RusheesController < ApplicationController
  def index
    render locals: { rushees: Rushee.all }
  end

  def search

  end

  def new
    render locals: { rushee: Rushee.new }
  end

  def create
    rushee = Rushee.create(rushee_params)
    if rushee.errors.full_messages.any?
      raise rushee.errors.full_messages.join("\n")
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
