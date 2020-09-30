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
end