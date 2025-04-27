node {
    stage('stage-1') {
        echo 'hello world'
    }
    stage('stage-2') {
        echo 'hello world -2'
    }
}

# or 

node {
    stage('git checkout') {
            git branch: 'main', url: 'https://github.com/swamyCloud/terraform.git'
    }
    stage('terraform init') {
            dir('day-1') {
                sh 'terraform init'
            }
    }
    stage('terraform plan') {
        dir('day-1') {
            sh 'terraform plan'
        }
    }
    stage('terraform destroy') {
        dir('day-1') {
            sh 'terraform ${action} -auto-approve'
        }
    }
}