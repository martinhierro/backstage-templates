pipeline {
    agent any

    triggers{
        githubPush()
    }
    
    tools {
        jdk 'jdk_11_latest'
        gradle 'gradle_6_8_1'
    }

    environment {
        JAVA_HOME = "${tool 'jdk_11_latest'}"
        GRADLE_HOME = "${tool 'gradle_6_8_1'}"
    }

    stages {
        stage ('Test & Build JAR file') {
            steps {
                sh 'which java && gradle test && gradle clean build'
            }
        }

//        stage ('Send JAR to remote server') {
//            steps {
//                    sh 'scp build/libs/spring-boot-0.0.1-SNAPSHOT.jar ${USER}@${REMOTE_ADDRESS}:/home/ubuntu'
//            }
//        }
//
//        stage ('Deploy JAR to remote server') {
//            steps {
//                sh '''
//                  ssh -f ${USER}@${REMOTE_ADDRESS} "nohup java -jar /home/${USER}/spring-boot-0.0.1-SNAPSHOT.jar &"
//                '''
                
//            }
//        }
    }
}
