class ApplicationController < ActionController::API
  include Authenticable
  include Rails::Pagination
  before_action :authenticate_request!
  before_action :retrieve_page, only: :index

  # Callback to validate presence of page param.
  def retrieve_page
    return 1 if params[:page].blank?
    params[:page]
  end

  def set_pagination_headers(record)
    response.headers['X-Total-Pages'] = record.total_pages.to_s
    response.headers['X-Next-Page']   = record.next_page.to_s
    response.headers['X-Prev-Page']   = record.prev_page.to_s
  end
end

