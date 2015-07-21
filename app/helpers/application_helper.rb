module ApplicationHelper
  #ZM: Indents!!!!!!!!!!!!!!!!!!!!!!
    def logged_in?
    !!session[:user_id]
  end
end
