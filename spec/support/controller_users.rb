module ControllerUsers
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:user_admin)
      sign_in user
    end
  end
end