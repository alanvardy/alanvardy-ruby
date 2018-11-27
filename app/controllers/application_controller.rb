# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_filter :redirect_to_https
end
