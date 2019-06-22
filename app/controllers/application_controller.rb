# typed: false
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  ApplicationNotAuthenticated = Class.new(StandardError)

  rescue_from ApplicationNotAuthenticated do
    respond_to do |format|
      format.json { render json: { errors: [message: '401 Not Authorized'] }, status: :unauthorized }
      format.html do
        flash[:notice] = 'Not Authorized to access this page, please log in'
        redirect_to new_session_path
      end
      format.any { head 401 }
    end
  end

  def authentication_required!
    session[:current_user] || raise(ApplicationNotAuthenticated)
  end
end
