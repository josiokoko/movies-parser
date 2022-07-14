pipeline {
    agent any
    environment {
            DOCKERHUB_CREDENTIALS=credentials('docker-josiokoko')
            imageName = 'josiokoko/movies-parser'
      }
      
      stages {
        
        stage("Checkout"){
            steps{
                checkout scm
            }
        }
        stage("Quality Tests"){
            steps {
                script{
                    def imageTest= docker.build("${imageName}-test", "-f Dockerfile.test .")
                    imageTest.inside{
                        sh 'golint'
                    }
                }
            }
        }
        
        stage("Unit Tests"){
            steps {
                script{
                    docker.build("${imageName}-test", "-f Dockerfile.test .")
                    sh "go test"
                }
            }
        }
        
   }
}
