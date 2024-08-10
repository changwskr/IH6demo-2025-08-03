pipeline {
    agent any
    tools {
        maven 'Maven3.8.5'
    }
    stages {
        stage('github clone'){
            steps {
                git branch: 'main', url: 'https://github.com/joneconsulting/cicd-web-project.git'
            }

        }
        stage('build'){
            steps {
                sh '''
                    echo build start
                    mvn clean compile package -DskipTest=true
                '''
            }
        }
        stage('deploy'){
            steps {
                deploy adapters: [tomcat9(credentialsId: 'admin_user', path: '', url: 'http://192.168.0.8:8088')], contextPath: null, war: '**/*.war'            }
        }
    }
}