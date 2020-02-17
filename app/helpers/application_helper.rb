module ApplicationHelper
  def human_readable_datetime(datetime)
    # datetime.
    datetime.in_time_zone("Eastern Time (US & Canada)").strftime("%A, %d %b %Y %l:%M %p")
  end

  def display_title(content)
    content_tag(:h1, content, class: "display-4 text-center mt-4")
  end

  def submit_button_classes
    "btn btn-outline-dark mt-4"
  end
end
