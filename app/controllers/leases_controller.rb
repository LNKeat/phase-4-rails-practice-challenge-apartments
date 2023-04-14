class LeasesController < ApplicationController
    
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
