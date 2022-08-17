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
           
       stage("Unit Tests"){
          steps {
                echo "Unit Testing..."
            }
        }
          
         
          stage("Security Testing"){
              steps{
                  script{
                  
                        sh 'nancy /go/src/github/mlabouardy/movies-parser/Gopkg.lock'
                     
                  }
              }
          }  
          
        
   }
}
