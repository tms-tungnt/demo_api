module Response
  def render_json(objects, status = :ok)
    render json: objects, status: status
  end
end