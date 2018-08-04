Dado('que o nome da minha tarefa é {string}') do |nome_tarefa|
  @nome_tarefa = nome_tarefa
  DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email])
end

Dado('a data de finalização será {string}') do |data_finalizacao|
  @data_tarefa = data_finalizacao
end

Dado('quero taguear esta tarefa com:') do |tags|
  @tags = tags.hashes
end

Dado('eu já cadastrei esta tarefa e esqueci') do
  # @tarefas_page.cadastrar(@nome_tarefa, @data_tarefa)
  steps %(
    Quando faço o cadastro desta tarefa 
  )
end

Quando('faço o cadastro desta tarefa') do
  @tarefas_page.cadastrar(@nome_tarefa, @data_tarefa)
end

Então('devo ver esta tarefa com o status {string}') do |status_tarefa|
  # expect(@tarefas_page.painel).to have_content status_tarefa
  expect(
    @tarefas_page.buscar_tr(@nome_tarefa)
  ).to have_content status_tarefa
end

Então('devo ver a seguinte mensagem {string}') do |mensagem_alerta|
  expect(@tarefas_page.alerta).to eql mensagem_alerta
end

Então('devo ver somente {int} tarefa com o nome cadastrado') do |quantidade|
  res = DAO.new.buscar_tarefa(@nome_tarefa, @usuario[:email])
  expect(res.count).to eql quantidade

  @tarefas_page.voltar
  @tarefas_page.busca(@nome_tarefa)
  expect(@tarefas_page.busca_trs.size).to eql quantidade
end

# remover
Dado('que eu tenho uma tarefa indesejada') do
  @nome_tarefa = 'Tarefa boa'
  @data_tarefa = '20/08/2018'
  DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email])
  @tarefas_page.cadastrar(@nome_tarefa, @data_tarefa)
end

Quando('eu solicito a exclusão desta tarefa') do
  @tarefas_page.solicita_remocao(@nome_tarefa)
end

Quando('confirmo a ação de exclusão') do
  @tarefas_page.confirma_modal
end

Então('esta tarefa não deve ser exibida') do
  @tarefas_page.busca(@nome_tarefa)
  expect(@tarefas_page.busca_trs.size).to eql 0
end

Quando('eu desisto da exclusão') do
  @tarefas_page.deixa_queto_modal
end

Então('esta tarefa deve permanecer na lista') do
  
end
