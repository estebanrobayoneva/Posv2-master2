class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    @society_options = Society.all.map{ |u| [ u.nombre, u.id ] }
    @formasDePago = Payment.all
    

  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create

    @membership = Membership.new(membership_params)
    @membership.afiliarCliente = params[:client_id]
    @membership.create_receipt( params[:valor_pago], params[:formaDePago]  )
    @receipt = Receipt.last
    
    respond_to do |format|
      if @membership.save
        ReceiptNotifier.afiliacion(@membership, @membership.clients.last).deliver
        format.html { redirect_to @receipt, notice: 'Se ha afiliado exitosamente' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Se ha modificado exitosamente' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Se ha eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end
  def payQuota
      @membership = Membership.find(params[:membership_id])
      @formasDePago = Payment.all
      if @membership.periodicidad=='Mensual'
        @valor_pago = @membership.society.valor_mensual
      elsif @membership.periodicidad=='Anual'
        @valor_pago = 0
      end


  end
  def payQuotaReceipt
    @membership = Membership.find(params[:id])
    if @membership.periodicidad=='Mensual'
      @valor_pago = @membership.society.valor_mensual
    elsif @membership.periodicidad=='Anual'
      @valor_pago = 0
    end
    t = Time.new
    id = 0
    @membership.clients.each do |client|
      id = client.id
    end
    @membership.s_receipt(t, id, params[:formaDePago], @membership.id, @valor_pago)
    @membership.updateAcomulado(@valor_pago)

    @receipt = Receipt.last
    redirect_to @receipt, notice: 'Pago de cuota exitoso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:periodicidad, :fecha_afiliacion, :fecha_vencimiento, :fecha_cuota, :estado, :society_id, :client_id,
      :valor_pago, :formaDePago)
    end
end
