pipeline {
  agent {
    docker {
      image 'ruby'
      args '--link selenium'
    }
  }
  environment {
    CI = true
  }
  stages {
    stage('Bundle') {
      steps {
        sh "bundle install"
      }
    }
    stage('Run Features') {
      steps {
        script {
          try {
            sh "bundle exec cucumber -p ci"
          } finally {
            cucumber fileIncludePattern: '**/*.json', sortingMethod: 'ALPHABETICAL'
          }        
        }
      }
    }
    stage('Read to Production') {
      steps {
        input message: 'Testes finalizados com sucesso. Podemos ir pra produção?'
        echo "Subindo pra produção"
      }
    }
  }
}
