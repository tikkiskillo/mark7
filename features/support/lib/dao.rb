require 'mongo'

class DAO
  attr_accessor :client

  Mongo::Logger.logger = Logger.new('log/mongo.log')

  def initialize
    str_con = 'mongodb://aluno:qaninja@ds225078.mlab.com:25078/heroku_4m3km28x'
    @client = Mongo::Client.new(str_con)
  end

  def remover_tarefas(nome, email)
    user = obter_usuario(email)

    tasks = @client[:tasks]
    tasks.delete_many('title' => nome, 'createdBy' => user[:_id])
  end

  def buscar_tarefa(nome, email)
    user = obter_usuario(email)

    tasks = @client[:tasks]
    tasks.find('title' => nome, 'createdBy' => user[:_id])
  end

  def obter_usuario(email)
    users = @client[:users]
    users.find('profile.email' => email).first
  end
end
