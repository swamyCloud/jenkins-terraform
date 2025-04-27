# select checkbox 'This project is parameterized?' -> 
# Name form field -> enter action
# choices form field -> enter apply \n destroy


# Choose "Build with paramets and select apply/destroy" -> click on build

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
        stage('terraform destroy') {
            steps {
                dir('day-1') {
                    sh 'terraform ${action} -auto-approve'
                }
            }
        }
    }
}