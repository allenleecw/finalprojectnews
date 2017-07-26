class FavcompaniesController < ApplicationController
  before_action :set_favcompany, only: [:show, :edit, :update, :destroy]

  # GET /favcompanies
  # GET /favcompanies.json
  def index
    @favcompanies = Favcompany.all
  end

  # GET /favcompanies/1
  # GET /favcompanies/1.json
  def show
  end

  # GET /favcompanies/new
  def new
    @favcompany = Favcompany.new
  end

  # GET /favcompanies/1/edit
  def edit
  end

  # POST /favcompanies
  # POST /favcompanies.json
  def create
    @favcompany = Favcompany.new(favcompany_params)

    respond_to do |format|
      if @favcompany.save
        format.html { redirect_to @favcompany, notice: 'Favcompany was successfully created.' }
        format.json { render :show, status: :created, location: @favcompany }
      else
        format.html { render :new }
        format.json { render json: @favcompany.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favcompanies/1
  # PATCH/PUT /favcompanies/1.json
  def update
    respond_to do |format|
      if @favcompany.update(favcompany_params)
        format.html { redirect_to @favcompany, notice: 'Favcompany was successfully updated.' }
        format.json { render :show, status: :ok, location: @favcompany }
      else
        format.html { render :edit }
        format.json { render json: @favcompany.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favcompanies/1
  # DELETE /favcompanies/1.json
  def destroy
    @favcompany.destroy
    respond_to do |format|
      format.html { redirect_to favcompanies_url, notice: 'Favcompany was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favcompany
      @favcompany = Favcompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favcompany_params
      params.require(:favcompany).permit(:name)
    end
end
