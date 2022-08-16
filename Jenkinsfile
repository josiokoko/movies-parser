pipeline {
    agent any
    tools { go '1.19' }
    environment {
            DOCKERHUB_CREDENTIALS=credentials('DockerHub-josiokoko')
            imageName = 'josiokoko/movies-parser'
      }
      
      stages {
        
        stage("Checkout"){
            steps{
                checkout scm
            }
        }
          
        stage("Quality Test"){
            steps {
                script{
                    def imageTest= docker.build("${imageName}-test", "-f Dockerfile.test .")
                    imageTest.inside{
                        sh 'golint'
                    }
                }
            }
        }
          
          
        stage("Unit Test 1"){
            steps {
                sh 'go test'
              }
        }
        
        stage("Unit Tests"){
            steps {
                script{
                    def imageTestGo= docker.build("${imageName}-test-go", "-f Dockerfile .")
                    imageTestGo.inside{
                        sh 'go test'
                    }
                }
            }
        }
        
   }
}
