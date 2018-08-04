class PerfilPage
  include Capybara::DSL

  def alerta
    find('.alert-login')
  end

  def completa_cadastro(empresa, cargo)
    find('#profile-company').set empresa

    combo = find('select[name$=job]')
    combo.find('option', text: cargo).select_option

    click_button 'Salvar'
  end
end
