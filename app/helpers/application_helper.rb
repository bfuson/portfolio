module ApplicationHelper
  def sample_helper
    "<p>My helper</p>".html_safe
          # html_safe asserts that the html code entered here is safe and can be processed
          # leaving the "html_safe" assertion off will prevent the html from being processed, 
          # instead it will be displayed exactly as typed.  In this case,
          #  <p>My helper</p>
  end
  
  def login_helper
    if current_user.is_a?(User)
       link_to "Logout", destroy_user_session_path, method: :delete
    else
       (link_to "Register", new_user_registration_path) +
       "<br>".html_safe + 
       (link_to "Login", new_user_session_path)
    end
  end
  
end
