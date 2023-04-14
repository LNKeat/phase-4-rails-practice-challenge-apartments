class LeasesController < ApplicationController
    def index 
        leases = Lease.all
        render json:leases, only: [:id, :rent], include: [:apartment, :tenant]
    end
end
