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

    @cart=@bill.carts
    total_amount=0
    total_tax=0

    @cart.each do|c|
      p=@shop.products.find(c.product_id)
      pur=p.price * c.quantity
      total_amount= total_amount + pur
      tax = (p.tax*p.price) /100
      item_tax =tax*c.quantity
      total_tax = total_tax + item_tax
      item_total = pur + item_tax
      c.update(purchased_price: pur,tax_per_item: tax,item_tax: item_tax)
    end
    @amount_total =total_amount
    @tax_total =total_tax
    @net_amount=total_amount+total_tax
    @rounded_price = @net_amount.round()
    @balance=@bill.amount_paid-@rounded_price
    @bill.update(total_tax: @tax_total,total_amount: @amount_total,net_amount: @net_amount,balance: @balance)
    b=@bill.balance
    @c500=@c100=@c50=@c10=@c5=@c2=@c1=0
    while b>0  do
      if (b>=500)
        q=b/500
        @c500=@c500+q
        r=b%500
        b=r

      elsif (b>=100)
        q=b/100
        @c100=@c100+q
        r=b%100
        b=r
      elsif (b>=50)
        q=b/50
        @c50=@c50+q
        r=b%50
        b=r
      elsif (b>=10)
        q=b/10
        @c10=@c10+q
        r=b%10
        b=r
      elsif (b>=5)
        q=b/5
        @c5=@c5+q
        r=b%5
        b=r
      elsif (b>=2)
        q=b/2
        @c2=@c2+q
        r=b%2
        b=r
      elsif (b>=1)
        q=b/1
        @c1=@c1+q
        r=b%10
        b=r
      else
        break
      end

    end
    @bill.balance_denos.new(c500: @c500,c100: @c100,c50: @c50,c10: @c10,c5: @c5,c2: @c2,c1: @c1)
    @shop.denominations.update(five_hundred: @shop.denominations.pluck(:five_hundred).join.to_i+@bill.amounts.pluck(:five_hundred).join.to_i,hundred: @shop.denominations.pluck(:hundred).join.to_i+@bill.amounts.pluck(:hundred).join.to_i,fifty: @shop.denominations.pluck(:fifty).join.to_i+@bill.amounts.pluck(:fifty).join.to_i,ten: @shop.denominations.pluck(:ten).join.to_i+@bill.amounts.pluck(:ten).join.to_i,five: @shop.denominations.pluck(:five).join.to_i+@bill.amounts.pluck(:five).join.to_i,two: @shop.denominations.pluck(:two).join.to_i+@bill.amounts.pluck(:two).join.to_i,one: @shop.denominations.pluck(:one).join.to_i+@bill.amounts.pluck(:one).join.to_i)
    @shop.denominations.update(five_hundred: @shop.denominations.pluck(:five_hundred).join.to_i-@c500,hundred: @shop.denominations.pluck(:hundred).join.to_i-@c100,fifty: @shop.denominations.pluck(:fifty).join.to_i-@c50,ten: @shop.denominations.pluck(:ten).join.to_i-@c10,five: @shop.denominations.pluck(:five).join.to_i-@c5,two: @shop.denominations.pluck(:two).join.to_i-@c2,one: @shop.denominations.pluck(:one).join.to_i-@c1)
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
      @balance_deno=@bill.balance_denos

    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:email_id, :name, :amount_paid, :shop_id,carts_attributes: [ :product_id, :quantity, :id, :_destroy],amounts_attributes: [ :five_hundred, :hundred, :fifty, :ten, :five, :two, :one])
    end
end
