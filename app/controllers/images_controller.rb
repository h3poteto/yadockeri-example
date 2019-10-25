class ImagesController < ApplicationController
  before_action :set_image, only: [:picture_for]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.name = params[:image][:picture].original_filename
    @image.picture = params[:image][:picture].read

    respond_to do |format|
      if @image.save
        format.html { redirect_to images_path, success: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: images_path }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def picture_for
    send_data(@image.picture)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.fetch(:image, {}).permit(:name, :picture)
    end
end
