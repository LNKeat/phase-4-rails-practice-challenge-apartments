class TenantsController < ApplicationController
    def index 
        tenants = Tenant.all
        render json: tenants, only: [:name, :id, :age], include: [:leases, :apartments]
    end

    def show 
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def destroy 
        tenant = Tenant.find(params[:id])
        tenant.destroy
        render json: { message: "You DID IT!"}
    end
end
