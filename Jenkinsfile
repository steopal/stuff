pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'b549cc87-3dbb-4722-b80c-58b6437d9c51',
                    url: 'git@github.com:steopal/stuff.git'
            }
        }
        stage('running ansible revive collection') {
            steps {
               sh"sudo docker build  -t test . && sudo docker run -d -p 8081:80 test"
            }
        }
    }
}

