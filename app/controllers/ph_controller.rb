class PhController < ApplicationController
  before_action :set_ph, only: [:show, :edit, :update, :destroy]

  # GET /ph
  # GET /ph.json
  def index
    @ph = Ph.all
  end

  # GET /ph/1
  # GET /ph/1.json
  def show
  end

  # GET /ph/current
  # GET /ph/current.json
  def current
    @ph = Ph.order(created_at: :desc).first
    respond_to do |format|
      format.html { redirect_to @ph }
      format.json { render :show, status: :ok, location: @ph }
    end
  end

  # GET /ph/new
  def new
    @ph = Ph.new
  end

  # GET /ph/1/edit
  def edit
  end

  # POST /ph
  # POST /ph.json
  def create
    @ph = Ph.new(ph_params)

    respond_to do |format|
      if @ph.save
        format.html { redirect_to @ph, notice: 'Ph was successfully created.' }
        format.json { render :show, status: :created, location: @ph }
      else
        format.html { render :new }
        format.json { render json: @ph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ph/1
  # PATCH/PUT /ph/1.json
  def update
    respond_to do |format|
      if @ph.update(ph_params)
        format.html { redirect_to @ph, notice: 'Ph was successfully updated.' }
        format.json { render :show, status: :ok, location: @ph }
      else
        format.html { render :edit }
        format.json { render json: @ph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ph/1
  # DELETE /ph/1.json
  def destroy
    @ph.destroy
    respond_to do |format|
      format.html { redirect_to ph_index_url, notice: 'Ph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ph
      @ph = Ph.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ph_params
      params.require(:ph).permit(:measure)
    end
end
