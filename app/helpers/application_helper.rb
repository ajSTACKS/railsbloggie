module ApplicationHelper

  def login_helper
     if current_user.is_a?(GuestUser)
      #if its a guest user then show register
      (link_to 'Login', new_user_session_path) +
      "<br>".html_safe +
      (link_to 'Register', new_user_registration_path )
     else
       link_to 'Logout', destroy_user_session_path, method: :delete
     end
  end


  def source_helper(layout_name)
    if session[:source]
      greeting = "Fucker, thanks for visiting  #{session[:source]} and your are on the  #{layout_name} page"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    AjCopyrightTool::Renderer.copyright 'Angelo Jimenez',
                                        'All Rights Reserved',
                                        'style="color: orange"'

  end
end
