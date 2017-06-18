class NotesController < ApplicationController
   before_action :set_book, only: [:create, :destroy]

   def create
    @note = @B=book.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @book, notice: 'Note was successfully added.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { redirect_to @book, alert: "Unable to add note!" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = @book.notes.find(params[:id])
    @note.destroy
    redirect_to @book, notice "Note deleted!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :note)
    end  

end