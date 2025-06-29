pipeline {
  agent {
     docker {
          image 'maven:3.9.6-eclipse-temurin-17'
          args '-v /var/run/docker.sock:/var/run/docker.sock'
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
        sh 'docker build -t ricti/dp-alpine:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push ricti/dp-alpine:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}