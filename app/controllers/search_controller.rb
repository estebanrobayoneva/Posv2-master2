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

  def createmembership
    palabra = "%#{params[:keyword]}%"
    palabra1 = "%#{params[:keyword1]}%"

    if palabra != "" && palabra1 != ""
      @memberships = Membership.where('fecha_afiliacion LIKE ? AND society_id LIKE ?', palabra, palabra1)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @memberships}
        format.js
      end
    elsif palabra !="" && palabra1 == ""
      @memberships = Membership.where('fecha_afiliacion LIKE ?', palabra)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @memberships}
        format.js
      end
    else
      @memberships = Membership.where('society_id LIKE ?', palabra1)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json {render json: @memberships}
        format.js
      end
    end



  end


  end

