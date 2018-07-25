class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :current_user, only: [:create]

  def create
    user = User.find_by(username: params['username'])

    return head :not_found unless user && user.authenticate(params['password'])

    session = Session.new(user_id: user.id)
    if session.save
        render json: session
    else
      head :internal_server_error
    end
  end
end
