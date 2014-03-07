module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Akho"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def base64_image image_data
    "<img src='data:image/png;base64,#{image_data}' />".html_safe
  end
  
end