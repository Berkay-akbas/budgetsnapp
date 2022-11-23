module ApplicationHelper
  def nav_bar_content(controller)
    if controller == 'categories'
      'Categories'
    elsif controller == 'splash'
      'Welcome'
    elsif controller == 'devise/sessions'
      'LOGIN'
    elsif controller == 'devise/registrations'
      'REGISTER'
    else
      'Not implemented'
    end
  end
end
