module ApplicationHelper
  def nav_bar_content(controller)
    if controller == 'categories'
      'Categories'
    elsif controller == 'splash'
      'Welcome'
    else
      'Not implemented'
    end
  end
end
