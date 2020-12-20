pipeline {
  agent any
  stages {
    stage('1. Clone Repository'){
      steps {
        checkout scm
      }
    }
    stage('2. Build Image') {
      steps {
        script {
         app = docker.build("amcint208/coursework_2") 
        }
      }
    }
    stage('3. Push Image') {
      steps {
        script {
          docker.withRegistry('', 'DockerHub') {
            app.push("${env.BUILD_NUMBER}") 
          }
        }
      }
    }
   stage('4. SonarQube') {
     environment {
       scannerHome = tool 'SonarQube'
     }    
     steps {
       withSonarQubeEnv('SonarQube') {
         sh "${scannerHome}/bin/sonar-scanner"
       }
       /*timeout(time: 10, unit: 'MINUTES') {
         //waitForQualityGate abortPipeline: true
      }*/
     }
    }
/*    stage('5. Deploy to Kubernetes') {
      
    }*/
  }
  post {
    always {
     echo 'Pipeline Complete' 
    }
    success {
      echo 'Pipeline Successful'
      sh "ssh ubuntu@54.236.25.155 'kubectl set image deployments/coursework2 coursework-2-b7xlv=amcint208/coursework_2:${env.BUILD_NUMBER}'"
    }
    failure {
      echo 'Pipeline Not Successful'
    }
  }
}
