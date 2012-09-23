class SalesController < ApplicationController
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new
    a = session[:id]
    @customer = Customer.find(a)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale }
      format.json { render json: @customer }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
    #var resultado=0
    #@ficha = Ficha.new(params[:ficha])
    #@ficha.saldo = @ficha.abono + @ficha.cargo

    @sale = Sale.new(params[:sale])
    #abort(params[:sale][:product_ids])
    #params[:sale][:product_ids].each_with_index do |elemento, indice|
     # "Aca hacemos lo que queremos con el elemento #{elemento} y con el indice #{indice}"
    #@product = Product.find(elemento)
    #@elemento1 =  2+@product.price 
    #puts "->>"+elemento
    #abort(@product.title)
    #resultado = resultado +elemento1
    #abort(elemento1)
    #end
@elemento1 = 0
#array = [1, "dos", 3]
params[:sale][:product_ids].each { |item|
 #puts "item :"+item 
 if item != ""
  #puts "No es vacio"
  @product = Product.find(item)
  @elemento1 =  @elemento1 + @product.price 
 
 end
 #@sums= 3 + @product.price
 #puts "====>>>>"
  }

    
    puts @elemento1
    params[:sale][:total] = @elemento1
    
    #abort("final");
    respond_to do |format|
      if @sale.save
        @sale = Sale.find(@sale.id)
        @sale.update_attributes(:customer_id => session[:id], :total => @elemento1)
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end
end
