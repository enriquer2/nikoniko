module ControllerUsers
  def login_admin
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:admin)
      sign_in user
    end
  end

  def login_boss
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:boss)
      sign_in user
    end
  end

  def login_teamleader
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:teamleader)
      sign_in user
    end
  end

  def login_employee
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(:employee)
      sign_in user
    end
  end
end
