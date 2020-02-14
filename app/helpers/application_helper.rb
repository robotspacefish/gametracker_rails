module ApplicationHelper
  def human_readable_datetime(datetime)
    # datetime.
    datetime.in_time_zone("Eastern Time (US & Canada)").strftime("%A, %d %b %Y %l:%M %p")
  end
end
