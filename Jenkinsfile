pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                echo 'Clonning github code'
                git url:"https://github.com/laxminarayan183/react-docker-jenkins.git",branch:"main"
                echo "Code clone successfull"
            }
        }
        stage("Build"){
            steps{
                echo "Building code using docker"
                bat "docker build -t react-docker-jenkins ."
            }
          }
         stage("Deploy"){
              steps{
                echo "deploying on port 5173"
                bat "docker run -d -p 5173:5173 react-docker-jenkins"
             }
        }
        stage("Push to DockerHub"){
              steps{
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword('credentialsId':"dockerHubCred",
                passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    bat "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    bat "docker image tag react-docker-jenkins ${env.dockerHubUser}/react-docker-jenkins"
                    bat "docker push ${env.dockerHubUser}/react-docker-jenkins"
                }
             }
        }
    }
}
