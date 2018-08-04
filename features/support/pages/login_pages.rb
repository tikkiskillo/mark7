class LoginPage
  include Capybara::DSL
  
  def campo_email
    find('#login_email')
  end

  def campo_senha
    find('input[title$=password]')
  end

  def botao_entrar
    find('button[id*=btnLogin]')
  end
end
