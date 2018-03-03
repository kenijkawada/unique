class IntroductionsController < ApplicationController
  before_action :set_introduction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /introductions
  # GET /introductions.json
  def index
    @introductions = Introduction.all
  end

  # GET /introductions/1
  # GET /introductions/1.json
  def show
  end

  # GET /introductions/new
  def new
    @introduction = Introduction.new
  end

  # GET /introductions/1/edit
  def edit
    @introduction.user_id = current_user.id
  end

  # POST /introductions
  # POST /introductions.json
  def create
    @introduction = Introduction.new(introduction_params)
    @introduction.user_id = current_user.id
    respond_to do |format|
      if @introduction.save
        format.html { redirect_to user_path(current_user), notice: 'Introduction was successfully created.' }
        format.json { render :show, status: :created, location: @introduction }
      else
        format.html { render :new }
        format.json { render json: @introduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /introductions/1
  # PATCH/PUT /introductions/1.json
  def update
    respond_to do |format|
      if @introduction.update(introduction_params)
        format.html { redirect_to user_path(current_user), notice: 'Introduction was successfully updated.' }
        format.json { render :show, status: :ok, location: @introduction }
      else
        format.html { render :edit }
        format.json { render json: @introduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /introductions/1
  # DELETE /introductions/1.json
  def destroy
    @introduction.destroy
    respond_to do |format|
      format.html { redirect_to introductions_url, notice: 'Introduction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_introduction
      @introduction = Introduction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def introduction_params
      params.require(:introduction).permit(:body, :user_id, :age, :area)
    end
end
