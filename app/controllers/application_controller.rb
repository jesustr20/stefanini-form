class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  include Pagy::Backend

  after_action { pagy_headers_merge(@pagy) if @pagy }

  def pagy_attributes
    {
      page: params[:page],
      items: params[:items] || Pagy::DEFAULT[:items]
    }
  end

  private
  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
