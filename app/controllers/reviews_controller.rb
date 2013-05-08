class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    #TODO: check if states is alreday watched
    #TODO: register whern states is not registeded before reviewing
    if params[:movie_id]
      @review = Review.new(:movie_id => params[:movie_id])
    else
      redirect_to "/"
    end
  end

  def create
    @review = Review.new(params[:review])

    if @review.save
      redirect_to @review, notice: "Successfully created!!"
    else
      render "new"
    end
  end

  #TODO:implement following method after session is complate
  def update
  end

  def edit
  end

  def destroy
  end

end
