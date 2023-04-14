class LeasesController < ApplicationController
    #create & destroy complete fully complete

    def index 
        tenants = Lease.all
        render json: tenants
    end
    
    def create 
        lease = Lease.create(permit_params)
        render json: lease
    end

    def destroy 
        lease = Lease.find(params[:id])
        lease.destroy
        render json: {message: "Three's a charm"}
    end

    private

    def permit_params 
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
