class VendorController < ApplicationController
  before_action :set_shop_datas
  def index
    @vendors = Vendor.where(online: true, verified: true, activated: true).includes(image_attachment: :blob,cover_attachment: :blob);
    # byebug
  end

  def show
    @vendor = Vendor.find(params[:id])
  end
  private

end
