class SearchController < ApplicationController
  def create
    palabra = "%#{params[:keyword]}%"
    palabra1 = "%#{params[:keyword1]}%"

    if palabra != "" && palabra1 != ""
      @products = Product.where('nombre LIKE ? AND cantidad LIKE ?', palabra, palabra1)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @products}
        format.js
      end
    elsif palabra !="" && palabra1 == ""
      @products = Product.where('nombre LIKE ?', palabra)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @products}
        format.js
      end
    else
      @products = Product.where('cantidad LIKE ?', palabra1)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @products}
        format.js
      end
    end



  end

  def createcli
    palabra = "%#{params[:keyword]}%"
    palabra1 = "%#{params[:keyword1]}%"

    if palabra != "" && palabra1 != ""
      @clients = Client.where('numero_documento LIKE ? AND membership_id LIKE ?', palabra, palabra1)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @clients}
        format.js
      end
    elsif palabra !="" && palabra1 == ""
      @clients = Client.where('numero_documento LIKE ?', palabra)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @clients}
        format.js
      end
    else
      @clients = Client.where('membership_id LIKE ?', palabra1)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @clients}
        format.js
      end
    end



  end


  end

