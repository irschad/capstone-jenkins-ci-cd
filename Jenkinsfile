pipeline {
  agent any
  stages {
    stage('Lint Dockerfile') {
      steps {
        sh 'hadolint Dockerfile'
      }
    }

    stage('Build docker image') {
      steps {
        sh 'docker build --tag=capsnew .'
      }
    }

    stage('Push docker image') {
      steps {
        sh ''' withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
docker tag capsnew irschad/capsnew
docker push irschad/capsnew
}'''
        }
      }

    }
  }