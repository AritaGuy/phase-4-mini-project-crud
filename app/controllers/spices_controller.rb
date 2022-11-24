class SpicesController < ApplicationController

    def index
        spice = Spice.all
        render json: spice, status: :ok
    end

    def create
        spice = Spice.create!(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
        spice.update(spice_params)
        render json: spice
        else
            render_not_found_response
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found_response
        render json: {error: "Plant not found"}, status: :not_found
    end
end
