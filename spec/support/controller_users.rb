module ControllerUsers
  def login_admin
    login_user(:admin)
  end

  def login_boss
    login_user(:boss)
  end

  def login_teamleader
    login_user(:teamleader)
  end

  def login_employee
    login_user(:employee)
  end

  def login_user(type)
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(type)
      sign_in user
    end
  end
end
