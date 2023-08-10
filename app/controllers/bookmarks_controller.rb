class BookmarksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @bookmark_books = @user.bookmark_books
  end

  def create
    book = Book.find(params[:book_id])
    bookmark = current_user.bookmarks.new(book_id: book.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    bookmark = current_user.bookmarks.find_by(book_id: book.id)
    bookmark.destroy
    redirect_to request.referer
  end
end
