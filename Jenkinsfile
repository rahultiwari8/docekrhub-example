pipeline {
    agent {
        docker {
            image 'openjdk:21' // You can choose another version, like 'openjdk:17'
        }
    }
    stages {
        stage('Compile') {
            steps {
                sh '''
                    echo "public class HelloWorld {" > HelloWorld.java
                    echo "    public static void main(String[] args) {" >> HelloWorld.java
                    echo "        System.out.println(\\"Hello from Java inside Docker!\\");" >> HelloWorld.java
                    echo "    }" >> HelloWorld.java
                    echo "}" >> HelloWorld.java

                    javac HelloWorld.java
                '''
            }
        }
        stage('Run') {
            steps {
                sh 'java HelloWorld'
            }
        }
    }
}
