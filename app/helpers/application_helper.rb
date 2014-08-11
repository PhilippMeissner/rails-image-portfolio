module ApplicationHelper
  def build_body_id
    "#{controller_name}-#{action_name}"
  end
end
