profile {
    agent any
 
      environment {
            DOCKERHUB_CREDENTIALS=credentials('docker-josiokoko')
            imageName = 'josiokoko/movies-parser'
      }
      stages{
        stage("Checkout"){
            steps{
                checkout sm
            }
        }
        stage("Quality Tests"){
            steps{
                script{
                    def imageTest= docker.build("${imageName}-test", "-f Dockerfile.test
                    imageTest.inside{
                        sh 'golint'
                    }
                }
            }
        }
      }
}
