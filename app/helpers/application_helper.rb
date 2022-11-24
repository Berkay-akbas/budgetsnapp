module ApplicationHelper
  def nav_bar_content(controller)
    case controller
    when 'categories'
      'Categories'
    when 'splash'
      'Welcome'
    when 'devise/sessions'
      'LOGIN'
    when 'devise/registrations'
      'REGISTER'
    when 'expenses'
      'Expenses'
    else
      'Not implemented'
    end
  end
end
