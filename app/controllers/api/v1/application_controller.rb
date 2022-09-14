class Api::V1::ApplicationController < ActionController::API
  include Response
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
end