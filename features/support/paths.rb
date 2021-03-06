module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    when /the new account page/
      new_account_path
    when /the account page/
      account_path
    when /the login page/
      new_user_session_path
    when /the password reset page/
      new_password_reset_path
    when /the wrong password reset page/
      edit_password_reset_path('not-the-real-token')
    when /my password reset page/
      @current_user.reload
      edit_password_reset_path(@current_user.perishable_token)

    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
