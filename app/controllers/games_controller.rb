class GamesController < ApplicationController


	def index
		@games = Game.all
	end

	def new
		# @game = Game.new
	end

	def create
		@game = Game.create(game_params)
		@game.white_player_id = current_user.id
		@game.initiate_new_board
		@game.save
		redirect_to game_path(@game)
	end

	def show
		@game = Game.find(params[:id])
	end

	private

	def game_params
		params.require(:game).permit(:name, :white_player_id, :black_player_id)
	end
end
