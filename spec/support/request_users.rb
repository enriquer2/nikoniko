module RequestUsers
  def login_admin
    before do
      @current_user = create(:admin)
      post user_session_path, params: {
        'user[email]' => @current_user.email,
        'user[password]' => @current_user.password
      }
      follow_redirect!
    end
  end
end
