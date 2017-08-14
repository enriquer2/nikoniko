module ControllerUsers
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:admin)
      sign_in user
    end
  end
  def login_boss
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:boss)
      sign_in user
    end
  end
  def login_teamleader
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:teamleader)
      sign_in user
    end
  end
  def login_employer
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:employer)
      sign_in user
    end
  end
end
