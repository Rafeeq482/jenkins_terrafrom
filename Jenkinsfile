pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID') 
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Rafeeq482/jenkins_terrafrom.git', branch: 'master'
            }
        }

        stage('Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -var="environment=dev"'
                }
            }
        }
        
        stage('Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve -var="environment=dev"'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Please check the logs.'
        }
    }
}
