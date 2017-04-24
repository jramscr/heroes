module Authenticable
  def authenticate_request!
    render json: { error: "Not authenticated" }, status: :unauthorized unless signed_user?
  end

  def current_user
    @current_user ||= { token: request.headers['Authorization'] }
  end

  def signed_user?
    #TODO: Implement correct token authorization.
    current_user[:token] == "Basic bXlfdXNlcjpteV9wYXNzd29yZA=="
  end
end
