class ProjxesController < ApplicationController

  before_action :authenticate, except: [:show]

  # GET /projxes
  # GET /projxes.json
  def index
    @projxes = Projx.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @users = User.all
  end

  # GET /projxes/1
  # GET /projxes/1.json
  def show
    # @projx = Projx.find(params[:id])
    @projx = Projx.where(created_at: 10.days.ago..Time.now).find(params[:id])
    @bscenes = Bscene.where(projx_id: @projx)
  end

  # GET /projxes/new
  def new
    @projx = current_user.projxes.build
  end

  # GET /projxes/1/edit
  def edit
    @projx = Projx.find(params[:id])
  end

  # POST /projxes
  # POST /projxes.json
  def create
    @projx = current_user.projxes.build(projx_params)
    respond_to do |format|
      if @projx.save
        format.html { redirect_to @projx, notice: 'Projx was successfully created.' }
        format.json { render :show, status: :created, location: @projx }
      else
        format.html { render :new }
        format.json { render json: @projx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projxes/1
  # PATCH/PUT /projxes/1.json
  def update
    @projx = Projx.find(params[:id])
    respond_to do |format|

      if @projx.update(projx_params)
        format.html { redirect_to @projx, notice: 'Projx was successfully updated.' }
        format.json { render :show, status: :ok, location: @projx }
      else
        format.html { render :edit }
        format.json { render json: @projx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projxes/1
  # DELETE /projxes/1.json
  def destroy

    @projx = Projx.find(params[:id])
    @user = current_user
    if @projx.destroy
      redirect_to user_path(@user)
    end
  end

  # def upvote
  #   @projx = Projx.find(params[:id])
  #   @projx.upvote_by current_user
  #   redirect_to :back
  # end

  private

  def authenticate
    :authenticate_user! && current_user.try(:admin?)
  end
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
  def projx_params
    params.require(:projx).permit(:title, :type_skill, :location, :description, :website, :date, :stime, :etime, :user_id)
  end
end
