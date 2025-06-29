pipeline {
  agent {
     docker {
          image 'maven'
        }
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('ricti-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'mvn --version'
        sh 'docker build -t ricti/maven .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push ricti/maven'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}