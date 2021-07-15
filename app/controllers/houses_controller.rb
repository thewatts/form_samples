class HousesController < ApplicationController
  # GET /houses
  def index
    @houses = House.all
  end

  # GET /houses/1
  def show
    @house = House.find(params[:id])
  end

  # GET /houses/new
  def new
    @house = HouseForm.new
  end

  # GET /houses/1/edit
  def edit
    @house = HouseForm.new(id: params[:id])
  end

  # POST /houses
  def create
    @house_form = HouseForm.new(house_params)

    if @house_form.save
      redirect_to @house_form, notice: 'House was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /houses/1
  def update
    @house = HouseForm.new(house_params.merge(id: params[:id]))

    if @house.save
      redirect_to @house, notice: 'House was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /houses/1
  def destroy
    @house = House.find(params[:id])
    @house.destroy

    redirect_to houses_url, notice: 'House was successfully destroyed.'
  end

  private
    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(:name, :address)
    end
end
