class RusheesController < ApplicationController
  def search

  end

  def new
    render locals: { rushee: Rushee.new }
  end
end
