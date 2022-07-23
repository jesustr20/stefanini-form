module Api
  module V1
    class LabsController < ApplicationController
      def index
        service = ::Labs::List.new(options: params)
        @pagy, records = pagy(service.perform, pagy_attributes)
        render json: LabsSerializer.render(records)
      end
    
      def show
        render json: LabsSerializer.render(lab)
      end
    
      def create
        service = ::Labs::Create.new(attributes: permitted_params)
        render json: LabsSerializer.render(service.perform)
      end
    
      def update
        service = ::Labs::Update.new(labs: lab, attributes: permitted_params)
        render json: LabsSerializer.render(service.perform)
      end
    
      def destroy
        service = ::Labs::Destroy.new(labs: lab)
        render json: LabsSerializer.render(service.perform)
      end

      private
      
      def lab
        @laboratory ||= Lab.find(params[:id])
      end

      def not_found
        raise ActionController::RoutingError.new('Not Found')
      end

      def permitted_params
        params.permit(:labname, :productname, :amount, :price, :code)
      end
    end
  end
end
