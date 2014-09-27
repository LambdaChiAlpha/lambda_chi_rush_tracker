class NotesController < ApplicationController
  def new
    rushee = Rushee.find(params[:rushee_id])
    render locals: { rushee: rushee, note: Note.new(rushee: rushee) }
  end

  def create
    note = Note.create!(note_params)
    redirect_to note.rushee
  end

  private

  def note_params
    params.require(:note).permit(:rushee_id, :submitter, :content, :impression)
  end
end
