def credential = 'Indizzy'
def server = 'awan@103.63.25.25'
def directory = 'literature-frontend'
def branch = 'production'
def url = 'https://github.com/Indizzy/literature-frontend'

pipeline{
    agent any
    stages{
        stage ('pull from repo'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    git remote add origin ${url} || git remote set-url origin ${url}
                    
                    git pull ${url} ${branch}
                    exit
                    EOF"""
                }
            }
        }
        stage ('docker build'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose build
                    exit
                    EOF"""
                }
            }
        }
        stage ('docker up'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose up -d
                    exit
                    EOF"""
                }
            }
        }
    }
}
