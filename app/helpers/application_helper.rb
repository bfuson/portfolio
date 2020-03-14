module ApplicationHelper
  def sample_helper
    "<p>My helper</p>".html_safe
          # html_safe asserts that the html code entered here is safe and can be processed
          # leaving the "html_safe" assertion off will prevent the html from being processed, 
          # instead it will be displayed exactly as typed.  In this case,
          #  <p>My helper</p>
  end
  
  def login_helper style = ''   # another way to pass parameters to the method.
                                # empty string argument => allows the app to set individual styles at execution time
    if current_user.is_a?(GuestUser)
       (link_to "Register", new_user_registration_path, class: style) + " ".html_safe + 
       (link_to "Login", new_user_session_path, class: style)    # give the guest user the registration option
    else
       link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end
  
  def source_helper(layout_name)    # another way to pass parameters to the method.
    if session[:source]
       greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
       content_tag(:p, greeting, class: "source-greeting")
    end
  end
  
  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Copyright owner - WAF,  ', '    All rights reserved'
  end
  
end
