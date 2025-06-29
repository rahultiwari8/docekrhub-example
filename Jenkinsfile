pipeline {
  agent {
          docker {
              image 'docker:dind'
              args '--privileged' // Needed for Docker-in-Docker

          }
      }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }

  stages {
    stage('Build') {
      steps {

        echo 'mvn --version'
        sh 'docker build -t ricti/maven .'
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
        sh 'docker push ricti/maven'
        echo 'push'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
        echo 'logout'
    }
  }
}