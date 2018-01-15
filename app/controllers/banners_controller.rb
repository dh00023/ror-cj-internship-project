class BannersController < ApplicationController
  load_and_authorize_resource
  before_action :set_banner, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id]
      category = Category.find params[:category_id]
      @banners = category.banners
    end 
  end

  def show
  end

  def new
    @banner = Banner.new
    authorize! :write, @banner
  end

  def edit
  end

  def create
    
    @banner = Banner.new(banner_params)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to @banner, notice: 'Banner was successfully created.' }
        format.json { render :show, status: :created, location: @banner }
      else
        format.html { render :new }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to @banner, notice: 'Banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to category_banners_path(@banner.category), notice: 'Banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banner_params
      params.require(:banner).permit(:category_id, :image, :name)
    end
end
