module TestHelpers
  # extend self

  def log_in_user(user)
    visit root_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_button 'Login'
  end
  def stub_current_user(user)
    ApplicationController.any_instance.stub(:current_user) {user}
  end
end