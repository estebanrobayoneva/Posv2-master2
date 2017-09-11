class SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy]

  # GET /societies
  # GET /societies.json
  def index
    @societies = Society.all
  end

  # GET /societies/1
  # GET /societies/1.json
  def show
  end

  # GET /societies/new
  def new
    @society = Society.new

  end

  # GET /societies/1/edit
  def edit
  end
  
  
  def search
    
      @society = Society.search(params[:search_param])
       @client = Client.find(session[:current_client_id])

    puts(@client)
      if @society
       
      render partial: 'memberships/form'
      else
      render status: :not_found, nothing: true
      end
  end
  
  
   def afiliar_mensual
    t = Time.new
    Membership.create(periodicidad: "Mensual" ,fecha_afiliacion: t,fecha_vencimiento: t.next_month, fecha_cuota: t.next_month, estado: true, society_id: params[:society_id])
    @client_a = Client.find(session[:current_client_id])
    @membership = Membership.last
    @society = Society.find(params[:society_id])
    @forma_pago = Payment.where("nombre = 'Efectivo'")
    @client_a.update(membership_id: @membership.id)
    Receipt.create(fecha: t, :valor => @society.valor_mensual, client_id: @client_a.id, :payment_id => @forma_pago.first.id) 
    Detail.create(cantidad_producto: 1, precio: @society.valor_mensual, receipt_id: Receipt.last.id, membership_id: Membership.last.id )
    @receipt = Receipt.last
    redirect_to @receipt
   end
   
   def afiliar_anual
     
     t = Time.new
    Membership.create(periodicidad: "Anual" ,fecha_afiliacion: t,fecha_vencimiento: t.next_year, fecha_cuota: t.next_year, estado: true, society_id: params[:society_id])
    @client_a = Client.find(session[:current_client_id])
    @membership = Membership.last
    @society = Society.find(params[:society_id])
    @forma_pago = Payment.where("nombre = 'Efectivo'")
    @client_a.update(membership_id: @membership.id)
    Receipt.create(fecha: t, :valor => @society.valor_anual, client_id: @client_a.id, :payment_id => @forma_pago.first.id) 
    Detail.create(cantidad_producto: 1, precio: @society.valor_anual, receipt_id: Receipt.last.id, membership_id: Membership.last.id )
    @receipt = Receipt.last
    redirect_to @receipt
     
   end
  

  # POST /societies
  # POST /societies.json
  def create
    @society = Society.new(society_params)

    respond_to do |format|
      if @society.save
        format.html { redirect_to @society, notice: 'Se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @society }
      else
        format.html { render :new }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /societies/1
  # PATCH/PUT /societies/1.json
  def update
    respond_to do |format|
      if @society.update(society_params)
        format.html { redirect_to @society, notice: 'Se ha editado exitosamente.' }
        format.json { render :show, status: :ok, location: @society }
      else
        format.html { render :edit }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societies/1
  # DELETE /societies/1.json
  def destroy
    @society.destroy
    respond_to do |format|
      format.html { redirect_to societies_url, notice: 'Se ha eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def society_params
      params.require(:society).permit(:nombre, :descripcio, :valor_anual, :valor_semestral, :valor_mensual,
                                      :discounts_attributes => [:id, :porcentaje_descuento, :society_id, :category_id, :_destroy,
                                                                :category_attributes => [:id, :nombre]] )
    end
end
