class Store < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user
  has_many :store_products
  has_many :store_orders
  has_many :products, :through => :store_products
  has_attached_file :avatar, default_url: "/assets/default-logo.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true

  def self.store_types
    {
        1 => "Functional Store",
        2 => "Physical Store",
        3 => "Raw Materials Store",
        4 => "Production Store",
        5 => "General Store",
        6 => "Tools Store",
        7 => "Salvage Store",
        8 => "Packing Store",
        9 => "Spare Parts Store",
        10 => "Receipt Store",
        11 => "Quarantine Store",
        12 => "Finished Goods Store",
        13 => "Work-in-progress Store",
        14 => "Stationary Store",
        15 => "Bonded Store",
        16 => "Refrigerated Store",
        17 => "Flammable Materials Store",
        18 => "Dehumidified Store",
        19 => "Transit Sheds",
        20 => "Dry Tanks",
        21 => "Shed Storage",
        22 => "Open Yard",
        23 => "Physical Considerations",
        24 => "Central Store",
        25 => "Sub-store",
        26 => "Departmental Store",
        27 => "Group Store",
        28 => "Site Store",
    }
  end

end
