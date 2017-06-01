class SearchReceiptController < ApplicationController
 
  def create
    palabra = "%#{params[:keyword]}%"
    palabra1 = "%#{params[:keyword1]}%"
    @barra = "#{params[:btnBarra]}"
    @guardar = "#{params[:guardar]}"
    @torta = "#{params[:btnTorta]}"
    @lineal = "#{params[:btnLineal]}"
    @area = "#{params[:btnArea]}"
    @productos = "#{params[:productos]}"
    @cursos = "#{params[:cursos]}"
    @membresia = "#{params[:membresia]}"
    if palabra1 != nil
      @result = Receipt.search(palabra1)
      respond_to do |format|
        format.html { redirect_to reporterecibos_path}
        format.json {render json: @models}
        format.js
    end
      
  end


  end

  def reporterecibos

  end
end
