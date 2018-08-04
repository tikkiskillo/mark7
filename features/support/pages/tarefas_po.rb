class TarefasPage
  include Capybara::DSL

  def painel
    find('#task-board')
  end

  def cadastrar(nome, data_f)
    find('#insert-button').click

    within('#add-task') do
      fill_in 'title', with: nome
      fill_in 'dueDate', with: data_f
      click_on 'Cadastrar'
    end
  end

  def buscar_tr(nome)
    find('#tasks tbody tr', text: nome)
  end

  def alerta
    find('.alert-warn').text
  end

  def busca(nome)
    find('#search-input').set nome
    find('#search-button').click
  end

  def voltar
    click_on 'Voltar' if page.has_css?('#add-task')
  end

  def busca_trs
    trs = all('#tasks tbody tr')
  end

  def modal
    find('.modal-content')
  end

  def confirma_modal
    modal.find('button', text: 'Sim').click
  end

  def deixa_queto_modal
    modal.find('button', text: 'Não, deixa queto.').click
  end

  def solicita_remocao(nome)
    buscar_tr(nome).find('#delete-button').click
  end
end
