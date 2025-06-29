pipeline {
  agent any

  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }

  stages {
    stage('Build') {
      steps {
      script {
                for (int i = 1; i <= 100000000; i++) {
                  echo "Iteration: ${i}"
                }
              }
        echo 'mvn --version'
        //sh 'docker build -t ricti/maven .'
      }
    }
    stage('Login') {
      steps {
        //sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        echo 'login'
      }
    }
    stage('Push') {
      steps {
        //sh 'docker push ricti/maven'
        echo 'push'
      }
    }
  }
  post {
    always {
      //sh 'docker logout'
        echo 'logout'
    }
  }
}