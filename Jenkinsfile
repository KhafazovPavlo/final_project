properties([pipelineTriggers([githubPush()])])
pipeline{
    agent { 
	  label 'slave1'
	}
    tools {
      maven 'maven3'
    }
   
    stages{
       
        stage('Checkout SCM'){
            steps {
                checkout([
                 $class: 'GitSCM',
                 branches: [[name: 'master']],
                 userRemoteConfigs: [[
                    url: 'https://github.com/KhafazovPavlo/final_project',
                    credentialsId: 'github',
                 ]]
                ])
            }
        }
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
        stage('Docker Build'){
            steps{
                sh "sudo docker build -t pavelkhafazov/webapp:${BUILD_TAG} . "
            }
        }
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                    sh "sudo docker login -u pavelkhafazov -p ${dockerHubPwd}"
                }
                
                sh "sudo docker push pavelkhafazov/webapp:${BUILD_TAG} "
            }
        }
        stage('Remove Local Images'){
            steps{
                sh "sudo docker rmi -f pavelkhafazov/webapp:${BUILD_TAG} . "
            }
        }
        stage('Docker Deploy'){
            steps{
              ansiblePlaybook credentialsId: 'web-server', disableHostKeyChecking: true, 
                extras: "-e BUILD_TAG=${BUILD_TAG}", installation: 'ansible', inventory: 'web.inv', 
                    playbook: 'deploy-docker.yml'
            }
        }
    }
} 