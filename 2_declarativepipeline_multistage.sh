# ================================Terraform with Jenkins ============================================
#            ====== multi stage==============


pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/swamyCloud/terraform.git'
            }
        }
        stage('terraform init') {
            steps {
                dir('day-1') {
                    sh 'terraform init'
                }
            }
        }
        stage('terraform plan') {
            steps {
                dir('day-1') { 
                    sh 'terraform plan'
                }
            }
        }
        stage('terraform apply') {
            steps {
                dir('day-1') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
