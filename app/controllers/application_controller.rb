class ApplicationController < ActionController::API
  include Pagy::Backend

  after_action { pagy_headers_merge(@pagy) if @pagy }

  def pagy_attributes
    {
      page: params[:page],
      items: params[:items] || Pagy::DEFAULT[:items]
    }
  end
end
