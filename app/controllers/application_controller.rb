class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :current_user
  before_action :authenticate_user, if: proc { !((controller_path == 'users' && action_name == 'new') ||
                                                (controller_path == 'sessions' && action_name == 'new') ||
                                                (controller_path == 'users' && action_name == 'create') ||
                                                (controller_path == 'sessions' && action_name == 'create')) }


  def authenticate_user
    if @current_user == nil
      flash[:danger] = 'ログインしてください'
      redirect_to new_session_path
    end
  end
end
