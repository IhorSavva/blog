class ApplicationController < ActionController::API
  before_action :current_user

  def current_user
    @current_user ||= current_session.try(:user)

    head(:unauthorized) unless @current_user
  end

  def current_session
    @current_session ||= Session.not_expired.find_by(access_token: bearer_token)
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end
end
