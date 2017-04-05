class PurchaseReceiptsController < ApplicationController
  before_action :set_purchase_receipt, only: [:show, :edit, :update, :destroy]

  # GET /purchase_receipts
  # GET /purchase_receipts.json
  def index
    @purchase_receipts = PurchaseReceipt.all
  end

  # GET /purchase_receipts/1
  # GET /purchase_receipts/1.json
  def show
  end

  # GET /purchase_receipts/new
  def new
    @purchase_receipt = PurchaseReceipt.new
    @provider = Provider.new
    @provider_options = Provider.all.map{ |u| [ u.nombre, u.id ] }

  end

  # GET /purchase_receipts/1/edit
  def edit
    @provider_options = Provider.all.map{ |u| [ u.nombre, u.id ] }
  end

  # POST /purchase_receipts
  # POST /purchase_receipts.json
  def create
    @provider = Provider.new
    @purchase_receipt = PurchaseReceipt.new(purchase_receipt_params)

    respond_to do |format|
      if @purchase_receipt.save
        format.html { redirect_to @purchase_receipt, notice: 'Purchase receipt was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_receipt }
      else
        format.html { render :new }
        format.json { render json: @purchase_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_receipts/1
  # PATCH/PUT /purchase_receipts/1.json
  def update
    respond_to do |format|
      if @purchase_receipt.update(purchase_receipt_params)
        format.html { redirect_to @purchase_receipt, notice: 'Purchase receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_receipt }
      else
        format.html { render :edit }
        format.json { render json: @purchase_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_receipts/1
  # DELETE /purchase_receipts/1.json
  def destroy
    @purchase_receipt.destroy
    respond_to do |format|
      format.html { redirect_to purchase_receipts_url, notice: 'Purchase receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_receipt
      @purchase_receipt = PurchaseReceipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_receipt_params
      params.require(:purchase_receipt).permit(:fecha, :numero_factura, :valor_total, :provider_id,
                                :detail_purchase_receipts_attributes =>[:id, :purchase_receipt_id, :cantidad, :valor_unitario, :valor_final, :_destroy,
                                                                        :product_attributes => [:id, :nombre]])
    end
end
