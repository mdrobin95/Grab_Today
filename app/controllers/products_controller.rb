class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # @qr = RQRCode::QRCode.new(@product.qr_path.to_s, :size => 4, :level => :h)
    @qr = RQRCode::QRCode.new(@product.generate_qr, :size => 4, :level => :h)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
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

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_prod_attributes
    product= Product.where(id: params[:id]).first
    sps = StoreProduct.where(product_id: params[:id])
    sp_ids = sps.map{|s| s.id}
    store_names = sps.map{|s| Store.where(id: s.store_id).first.name}
    p = {name: product.name, product_type: product.product_type, brand: product.brand, manufacturer: product.manufacturer, store_names: store_names, sp_ids: sp_ids}

    render json: p
  end

  def get_query
    if params[:attr] == 'product_type'
      query = ProductType.where("category like '%#{params[:value]}%'")
      q = query.map{|e| {value: e.category}}.uniq
    elsif params[:attr] == 'variant'
      query = VariantType.where("name like '%#{params[:value]}%'")
      q = query.map{|e| {value: e.name}}.uniq
    else
      query = Product.where("#{params[:attr]} like '%#{params[:value]}%'")
      if params[:attr] == 'name'
        q = query.map{|e| {value: e.name}}.uniq
      elsif params[:attr] == 'brand'
        q = query.map{|e| {value: e.brand}}.uniq
      elsif params[:attr] == 'manufacturer'
        q = query.map{|e| {value: e.manufacturer}}.uniq
      end
    end
    render json: q
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :product_type, :brand, :manufacturer)
    end
end
