class DetailPurchaseReceiptsController < ApplicationController
  before_action :set_detail_purchase_receipt, only: [:show, :edit, :update, :destroy]

  # GET /detail_purchase_receipts
  # GET /detail_purchase_receipts.json
  def index
    @detail_purchase_receipts = DetailPurchaseReceipt.all
  end

  # GET /detail_purchase_receipts/1
  # GET /detail_purchase_receipts/1.json
  def show
  end

  # GET /detail_purchase_receipts/new
  def new
    @detail_purchase_receipt = DetailPurchaseReceipt.new
  end

  # GET /detail_purchase_receipts/1/edit
  def edit
  end

  # POST /detail_purchase_receipts
  # POST /detail_purchase_receipts.json
  def create
    @detail_purchase_receipt = DetailPurchaseReceipt.new(detail_purchase_receipt_params)

    respond_to do |format|
      if @detail_purchase_receipt.save
        format.html { redirect_to @detail_purchase_receipt, notice: 'Detail purchase receipt was successfully created.' }
        format.json { render :show, status: :created, location: @detail_purchase_receipt }
      else
        format.html { render :new }
        format.json { render json: @detail_purchase_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_purchase_receipts/1
  # PATCH/PUT /detail_purchase_receipts/1.json
  def update
    respond_to do |format|
      if @detail_purchase_receipt.update(detail_purchase_receipt_params)
        format.html { redirect_to @detail_purchase_receipt, notice: 'Detail purchase receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_purchase_receipt }
      else
        format.html { render :edit }
        format.json { render json: @detail_purchase_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_purchase_receipts/1
  # DELETE /detail_purchase_receipts/1.json
  def destroy
    @detail_purchase_receipt.destroy
    respond_to do |format|
      format.html { redirect_to detail_purchase_receipts_url, notice: 'Detail purchase receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_purchase_receipt
      @detail_purchase_receipt = DetailPurchaseReceipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_purchase_receipt_params
      params.require(:detail_purchase_receipt).permit(:cantidad, :valor_unitario, :valor_final, :purchase_receipt_id, :product_id )
    end
end
