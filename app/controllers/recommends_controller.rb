class RecommendsController < ApplicationController
  before_action :set_recommend, only: [:show, :edit, :update, :destroy]

  def index
    if params[:banner_id]
      banner = Banner.find params[:banner_id]
      @recommends = banner.recommends
    end 
  end

  def new
    @recommend = Recommend.new
  end

  def edit
  end

  def create
    @recommend = Recommend.new(recommend_params)

    respond_to do |format|
      if @recommend.save
        format.html { redirect_to  banner_recommends_path(@recommend.banner), notice: 'Recommend was successfully created.' }
        format.json { render :show, status: :created, location: @recommend }
      else
        format.html { render :new }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recommend.update(recommend_params)
        format.html { redirect_to banner_recommends_path(@recommend.banner), notice: 'Recommend was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommend }
      else
        format.html { render :edit }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recommend.destroy
    respond_to do |format|
      format.html { redirect_to  banner_recommends_path(@recommend.banner), notice: 'Recommend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_recommend
      @recommend = Recommend.find(params[:id])
    end

    def recommend_params
      params.require(:recommend).permit(:code, :banner_id)
    end
end
