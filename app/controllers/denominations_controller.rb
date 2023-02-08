 class DenominationsController < ApplicationController
   before_action :get_shop
  before_action :set_denomination, only: %i[ show edit update destroy ]

  # GET /denominations or /denominations.json
  def index
    @denominations = @shop.denominations

  end

  # GET /denominations/1 or /denominations/1.json
  def show
  end

  # GET /denominations/new
  def new
    @denomination = @shop.denominations.build
  end

  # GET /denominations/1/edit
  def edit
  end

  # POST /denominations or /denominations.json
  def create
    @denomination = @shop.denominations.build(denomination_params)

    respond_to do |format|
      if @denomination.save
        format.html { redirect_to shop_denominations_path(@shop), notice: "Denomination was successfully created." }
        format.json { render :show, status: :created, location: @denomination }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @denomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /denominations/1 or /denominations/1.json
  def update
    respond_to do |format|
      if @denomination.update(denomination_params)
        format.html { redirect_to shop_denominations_path(@shop), notice: "Denomination was successfully updated." }
        format.json { render :show, status: :ok, location: @denomination }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @denomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /denominations/1 or /denominations/1.json
  def destroy
    @denomination.destroy

    respond_to do |format|
      format.html { redirect_to shop_denominations_path(@shop), notice: "Denomination was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_shop
    @shop=Shop.find(params[:shop_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_denomination
      @denomination = @shop.denominations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def denomination_params
      params.require(:denomination).permit(:five_hundred, :hundred, :fifty, :twenty, :ten, :five, :two, :one, :shop_id)
    end
end
