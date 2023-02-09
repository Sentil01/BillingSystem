class BillsController < ApplicationController
  before_action :get_bill
  before_action :set_bill, only: %i[ show edit update destroy ]

  # GET /bills or /bills.json
  def index
    @bills =  @shop.bills
  end

  # GET /bills/1 or /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill =  @shop.bills.build
    @amount=@bill.amounts.build
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills or /bills.json
  def create
    @bill =  @shop.bills.build(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to shop_bills_path(@shop), notice: "Bill was successfully created." }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1 or /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to shop_bills_path(@shop), notice: "Bill was successfully updated." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to shop_bills_path(@shop), notice: "Bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def get_bill
    @shop=Shop.find(params[:shop_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = @shop.bills.find(params[:id])
      @cart=@bill.carts
      @amounts=@bill.amounts
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:email_id, :name, :amount_paid, :shop_id,carts_attributes: [ :product_id, :quantity, :id, :_destroy],amounts_attributes: [ :five_hundred, :hundred, :fifty, :ten, :five, :two, :one])
    end
end
