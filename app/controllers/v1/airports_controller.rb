module V1
  class AirportsController < ApplicationController
    def index
      @airports = Airport.all
      render json: @airports
    end

    def create
      @airport = Airport.new(airport_params)
      if @airport.save
        render json: @airport, status: :created
      else
        render json: @airport.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @airport = Airport.find(params[:id])
      if @airport
        @airport.destroy
        head :no_content
      else
        head :not_found
      end
    end


    private

    def airport_params
      params.require(:airport).permit(:code, :name, :terminals)
    end
  end
end
