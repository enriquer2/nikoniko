class FeelingsController < ApplicationController
  before_action :set_feeling, only: %i[show edit update destroy]

  # GET /feelings
  def index
    @feelings = policy_scope(Feeling)
    authorize @feelings
  end

  # GET /feelings/1
  def show; end

  # GET /feelings/new
  def new
    @feeling = Feeling.new
    authorize @feeling
  end

  # GET /feelings/1/edit
  def edit; end

  # POST /feelings
  def create
    @feeling = Feeling.new(feeling_params)
    authorize @feeling

    respond_to do |format|
      if @feeling.save
        format.html { redirect_to @feeling, notice: 'Feeling was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /feelings/1
  def update
    respond_to do |format|
      if @feeling.update(feeling_params)
        format.html { redirect_to @feeling, notice: 'Feeling was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /feelings/1
  def destroy
    @feeling.destroy
    respond_to do |format|
      format.html { redirect_to feelings_url, notice: 'Feeling was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feeling
    @feeling = Feeling.find(params[:id])
    authorize @feeling
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feeling_params
    params.require(:feeling).permit(:day, :status, :user_id)
  end
end
