class PackagesController < ApplicationController
  before_action :set_courier, only: [:create, :update]

  def create
    @package = @courier.packages.create(package_params)
    respond_to do |format|
      if @package.save
        format.html { redirect_to courier_path(@courier), notice: t('package_added') }
      else
        format.html { render :'couriers/show', status: :unprocessable_entity }
      end
    end
  end

  def update
    @package = Package.find(params[:id])
    @package.update(delivery_status: true)
    redirect_to courier_path(@courier), notice: t('package_delivered')
  end

  private
  def set_courier
    @courier = Courier.find(params[:courier_id])
  end

  def package_params
    params.require(:package).permit(:tracking_number, :delivery_status)
  end
end
