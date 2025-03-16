# delclarative pipeline with single stage

pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/swamyCloud/terraform.git'
            }
        }
        stage('terraform process') {
            steps {
                dir('day-1') {
                    sh 'terraform init'
                    sh 'terraform plan'
                    sh 'terraform apply -auto-approve' #destroy
                }
            }
        }
    }
}