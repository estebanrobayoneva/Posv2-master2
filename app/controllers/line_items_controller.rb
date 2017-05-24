class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index

    @line_items = LineItem.all
    var2 = session[:var1]

    @client = Client.where("numero_documento = ?", var2)

    puts(var2)
    def total_cuenta
      line_items.to_a.sum { |item| item.total_price }
    end

  end
  def send_receipt
    valorTfactura = "#{params[:precio_total]}"
    puts(valorTfactura)
    cedulaParticipante = session[:var1]

    #LineItem.create_receipt_cart(valorTfactura, cedulaParticipante)
    @participanteR = Client.where("numero_documento = ?", cedulaParticipante)
    t = Time.new
    @pago = Payment.where("nombre = 'Efectivo'")
    Receipt.create(fecha: t, valor: valorTfactura, client_id: @participanteR.first.id, payment_id: @pago.first.id)

    @lineall = LineItem.all

    @lineall.each do |detalle|
      Detail.create(cantidad_producto: detalle.quantity, precio: detalle.product.valor_unitario* detalle.quantity , product_id: detalle.product_id, receipt_id: Receipt.last.id )
    end


    @receipt = Receipt.last

    redirect_to @receipt


  end

  def findParticipante


    numD = "#{params[:cedula_participante]}"
    session[:var1] = numD

    @participante = Client.where("numero_documento = ?", numD)
    respond_to do |format|
      format.html { redirect_to line_items_path }
      format.js
    end



  end
  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    @line_item.product = product

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to tienda_path }
        format.json { render json: @line_item,
                             status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors,
                             status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id, :receipt_id, :cedula_participante, :precio_total)
  end
end