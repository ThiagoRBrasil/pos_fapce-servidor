class Api::V1::PiecesController < ApplicationController
	before_action :find_product, only: [:destroy]

	def index
		#render json: Piece.all, status: :ok

		piece = Piece.where product_id: params[:product_id]
		render json: piece, status: :ok
	end

	def create
		piece = Piece.new (piece_params)

		if piece.save 
			render json: piece, status: :created and return
		elsif piece.nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Piece not saved', errors: piece.errors}, status: error_status
	end

	def destroy
		@piece.destroy
	end

	def show
		piece = Piece.find_by product_id: params[:product_id]

		if piece.nil?
			render json: {message: "Pieces not found"}, status: :not_found
		else
			render json: pieces, status: :ok	
		end
	end

	private
	def find_pice
		@piece = Piece.find_by_id(params[:id])
	end

	def piece_params
		params.permit(:name, :number, :product_id)
	end
end
