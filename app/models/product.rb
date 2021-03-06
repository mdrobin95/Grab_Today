class Product < ActiveRecord::Base
  acts_as_paranoid
  has_many :store_products, dependent: :destroy
  has_many :stores, :through => :store_products
  # after_create :save_qr_path

  def all_unique(attr)
    products = []
    if !Product.all
      products
    else
      products = Product.all.order('name ASC')
      attrs = []
      if attr == 'name'
        products.each do |p|
          attrs << p.name
        end
      elsif attr == 'brand'
        products.each do |p|
          attrs << p.brand
        end
      elsif attr == 'manufacturer'
        products.each do |p|
          attrs << p.manufacturer
        end
      end
      attrs.uniq
    end
  end

  def generate_qr
    self.qr_path = "products/#{id}"
    save
    qr_path
  end

  # private
  # def save_qr_path
  #   self.qr_path = "products/#{id}"
  #   save
  # end

end
