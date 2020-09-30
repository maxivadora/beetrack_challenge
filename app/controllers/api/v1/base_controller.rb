module API::V1
  class BaseController < ActionController::API
    include JsonResponses
  end
end