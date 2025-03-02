class ApplicationController < ActionController::API

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id)
  end
end
