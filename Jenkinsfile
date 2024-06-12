pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters {
        choice(name: 'CHOICE', choices: ['Apply', 'Destroy'], description: 'Pick something')
    }
    stages {
        stage('Init') {
            steps {
                sh """
                cd 01-vpc
                terraform init -reconfigure
                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                cd 01-vpc
                terraform plan
                """
            }
        }
        stage('Deploy') {
            input {
                message "should we continue?"
                ok "yes, we should."
            }
            steps {
               sh """
                cd 01-vpc
                terraform apply -auto-approve
                """
            }
        }

    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success {
            echo 'I will run when pipeline is success'
        }
          failure {
            echo 'I will run when pipeline is failed'
        }
    }
}