pipeline {
    agent any
    
    environment {
        MAVEN_HOME = '/opt/maven/apache-maven-3.9.6'  
        PATH = "${MAVEN_HOME}/bin:${env.PATH}"
        registry = "557690602593.dkr.ecr.us-east-1.amazonaws.com/my-docker-repo"
        
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mohamedBenzouine/springboot-eks-helm-jenkins']])
            }
        }
        
        stage('mvn Version'){
            steps {
                sh "mvn --version"
            }
        }
        
        stage('Build Jar'){
            steps {
                sh "mvn clean install"
            }
        }
        
        stage('Build Image'){
            steps {
                script {
                    dockerImage= docker.build registry
                    dockerImage.tag("$BUILD_NUMBER")
                    
                    
                }
            }
        }
        
        stage('Push Image into ECR'){
            steps {
                script {
              
                    sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 557690602593.dkr.ecr.us-east-1.amazonaws.com"
                    sh "docker push 557690602593.dkr.ecr.us-east-1.amazonaws.com/my-docker-repo:$BUILD_NUMBER"
                }
            }
        }
        
        stage('Helm Deploy') {
            steps {
                script {
                    withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
                    sh "helm upgrade first --install mychart --namespace helm-deployment --set image.tag=$BUILD_NUMBER"
            }
        }
    }
}

    } 
}
