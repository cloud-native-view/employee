pipeline {
   agent any

   environment {
     SERVICE_NAME = "employee"
     REPOSITORY_TAG="${YOUR_DOCKERHUB_USERNAME}/${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      
      stage('Preparation') {
         steps {
            cleanWs()
            git credentialsId: 'GitHub', url: "https://github.com/${ORGANIZATION_NAME}/${SERVICE_NAME}"
         }
      }
      
      
      stage('Build') {
         steps {
            sh '''mvn clean package'''
         }
      }
      

      stage('Build image') {
         steps {
           sh 'docker image build -t ${REPOSITORY_TAG} .'
         }
      }
      
       stage('Push image') {
        withDockerRegistry([ credentialsId: "DockerHubID", url: "" ]) {
        sh 'docker push ${REPOSITORY_TAG}'
        }
        }

      
      stage('Deploy to Cluster') {
          steps {
                    sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl apply -f -'
          }
      }
      
   }
}