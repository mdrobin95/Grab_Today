class MockupsController < ApplicationController
  layout 'mockups_layout'

  def index
  end

  def sign_in
  end

  def sign_up
  end

  def stores
  end

  def store
  end

  def store_form
  end

  def product
    @qr = RQRCode::QRCode.new('Northface', :size => 2, :level => :h)
  end

  def product_form
  end

  def profile
  end

  def profile_update
  end

  def profile_password
  end
end
