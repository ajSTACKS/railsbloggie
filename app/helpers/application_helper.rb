module ApplicationHelper

  def login_helper style = ''
     if current_user.is_a?(GuestUser)
      #if its a guest user then show register
      (link_to 'Login', new_user_session_path, class: style) +
      " ".html_safe +
      (link_to 'Register', new_user_registration_path, class: style)
     else
       link_to 'Logout', destroy_user_session_path, method: :delete, class: style
     end
  end


  def source_helper(layout_name)
    if session[:source]
      greeting = "thanks for visiting  #{session[:source]} and your are on the  #{layout_name} page"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    AjCopyrightTool::Renderer.copyright 'Angelo Jimenez',
                                        'All Rights Reserved',
                                        'style="color: #00abc0"'

  end

  def nav_helper  tag_type
nav_links = <<NAV
<#{tag_type}><a href="#{root_path}" >Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_me_path}" >About</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" >Contact</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" >Blog</a></#{tag_type}>
<#{tag_type}><a href="#{portfolios_path}" >Portfolio</a></#{tag_type}>

NAV

  nav_links.html_safe
  end
end
