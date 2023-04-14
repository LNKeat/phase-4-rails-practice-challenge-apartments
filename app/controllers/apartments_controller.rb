class ApartmentsController < ApplicationController
    #full CRUD complete
    def index 
        apartments = Apartment.all
        render json: apartments, only: [:name, :id, :number], include: [:leases, :tenants]
    end

    def show 
        apartment = Apartment.find(params[:id])
        render json: apartment
    end

    def create 
        apartment = Apartment.create(apartment_params)
        render json: apartment
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_params)
        render json: apartment
    end


    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        render json: {message: "You did it again!!!"}
    end

    private

    def apartment_params 
        params.permit(:number, :leases, :tenants)
    end

end
