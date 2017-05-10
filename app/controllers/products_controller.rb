class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @provider = Provider.new
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv}
      format.xls #{ send_data @products.to_csv(col_sep: "\t")}
    end

  end
  
  def search
      @product = Product.search(params[:search_param])
      if @product
      render partial: 'products/lookup'
      else
      render status: :not_found, nothing: true
      end
  end
  
  
  def indexCourse
    @products = Product.all
    @provider = Provider.new
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv}
      format.xls #{ send_data @products.to_csv(col_sep: "\t")}
    end
  end
  def import
    Product.import(params[:file])
    redirect_to products_path, notice: "Productos importados"


  
  end
  def error
    redirect_to products_path, notice: "Extension desconocida"

  end
  # GET /products/1
  # GET /products/1.json
  def show
  end
  def showCourse
    @product = Product.find(params[:id])
  end
  
 

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end
  def newCourse
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end
  def editCourse
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @product }
        Product.last.update(tipo_producto: 1)
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end
  def createCourse
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to cursos_path, notice: 'Se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @product }
        Product.last.update(tipo_producto: 2)
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  def updateCourse
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Se ha editado exitosamente.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:nombre, :cantidad, :valor_unitario, :valor_total_curso, :category_id)
  end
end
