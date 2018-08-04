class LoginPage
  include Capybara::DSL
  def acessa
    visit '/login'
  end

  def alerta
    find('.alert-login')
  end

  def logar(email, senha)
    find('#login_email').set email
    find('input[name=password]').set senha
    find('button[id*=btnLogin]').click
  end
end
