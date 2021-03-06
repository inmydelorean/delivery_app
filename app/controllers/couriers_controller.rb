class CouriersController < ApplicationController
  before_action :set_courier, only: [:show, :edit, :update]

  def index
    @couriers = Courier.order(:id)
  end

  def show
  end

  def new
    @courier = Courier.new
  end

  def edit
  end

  def create
    @courier = Courier.new(courier_params)
    respond_to do |format|
      if @courier.save
        format.html { redirect_to @courier, notice: t('courier_added') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @courier.update(courier_params)
        format.html { redirect_to @courier, notice: t('courier_edited') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_courier
    @courier = Courier.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(:name, :email)
  end
end
