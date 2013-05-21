class UserMovieStatesController < ApplicationController

  def register
    my_id = 1 # TODO: session
    @user_movie_state = UserMovieState.get_user_movie_state(my_id, params[:movie_id])
    if @user_movie_state.blank?
      @user_movie_state = UserMovieState.new(
        :state_id => params[:state_id],
        :user_id => 1, # TODO
        :movie_id => params[:movie_id]
      )
      if @user_movie_state.save
        redirect_to :back, notice: 'success'
      else
        redirect_to :back, notice: 'failure'
      end
    else
      @user_movie_state.update_attributes(:state_id => params[:state_id])
      redirect_to :back
    end
  end
end
