pipeline {
    agent any
    environment {
            DOCKERHUB_CREDENTIALS=credentials('docker-josiokoko')
            imageName = 'josiokoko/movies-parser'
      }
      
      stages {
        def imageTest= docker.build("${imageName}-test", "-f Dockerfile.test .")
        stage("Checkout"){
            steps{
                checkout scm
            }
        }
        stage("Quality Tests"){
            steps {
                script{
                    imageTest.inside{
                        sh 'golint'
                    }
                }
            }
        }
      }
}
