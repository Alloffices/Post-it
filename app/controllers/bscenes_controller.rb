class BscenesController < ApplicationController
	before_action :authenticate_user!

	def create
		@projx = Projx.find(params[:projx_id])
		@bscene = @projx.bscenes.create(bscenes_params)

		redirect_to projx_path(@projx)
	end

	def destroy
		@projx = Projx.find params[:projx_id]
		@bscene = @projx.bscenes.find params[:id]
		@bscene.destroy
		redirect_to projx_path(@projx)
	end

	private

	def bscenes_params
		params.require(:bscene).permit(:video)
	end

end
