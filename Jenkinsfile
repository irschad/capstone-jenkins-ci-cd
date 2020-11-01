pipeline {
  agent any
  stages {
    stage('Lint Dockerfile') {
      steps {
        sh '''hadolint Dockerfile| tee -a hadolint_lint.txt
cat hadolint_lint.txt'''
      }
    }

  }
}