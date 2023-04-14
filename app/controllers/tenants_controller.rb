class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    #CRUD actions complete
    def show 
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def update 
        tenant = Tenant.find(params[:id])
        if tenant
            tenant.update(tenant_params)
            render json: tenant
        else
            render json: {error: "Tenant not found"}
        end
    end

    def destroy 
        tenant = Tenant.find(params[:id])
        tenant.destroy
        render json: { message: "You DID IT!"}
    end

    def create 
        tenant = Tenant.create(tenant_params)
        if tenant.valid?
            render json: tenant
        else
            render json: { error: tenant.errors }
        end 
    end

    private

    def tenant_params 
        params.permit(:name, :age)
    end
end
