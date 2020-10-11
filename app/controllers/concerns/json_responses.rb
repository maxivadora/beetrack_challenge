module JsonResponses
  def render_success(message:)
    render json: { 
      status: {
        error: false,
        message: message
      }
    },
    status: :ok
  end

  def render_error(errors:, status_code:, message: nil)
    render json: { 
      status: {
        error: true,
        message: message
      }
    },
    status: status_code
  end
end