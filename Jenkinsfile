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
         withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
            sh "docker tag capsnew irschad/capsnew"
            sh "docker push irschad/capsnew"
         }
      }
    }
    stage('Deploy the container'){
      steps {
         withAWS(region:'us-east-1',credentials:'aws') {
            sh "aws eks --region us-east-1 update-kubeconfig --name udajen"  
            sh "kubectl apply -f deployment.yml"
            sh "kubectl get nodes"
            sh "kubectl get deployment"
            sh "kubectl get pod -o wide"
            sh "kubectl get service/udajen"			                
         }
      }
    }    

  }
}
