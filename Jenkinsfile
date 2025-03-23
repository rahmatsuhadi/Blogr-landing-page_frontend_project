pipeline {
    agent any

    triggers {
        pollSCM('H/1 * * * *')  // Memeriksa perubahan setiap 1 menit
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/rahmatsuhadi/Blogr-landing-page_frontend_project.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t landing-page-image:latest .'
            }
        }

        stage('Test') {
            steps {
                script {
                    // Cek apakah container dengan nama 'landing-page' sudah berjalan
                    def existingContainer = sh(script: "docker ps -q -f name=landing-page", returnStdout: true).trim()

                    // // Jika container sudah ada, stop dan hapus container tersebut
                    if (existingContainer) {
                        echo "Stopping and removing existing container..."
                        sh 'docker stop landing-page || true'  // Menghentikan container jika ada
                        sh 'docker rm landing-page || true'    // Menghapus container jika ada
                    }

                    // // Menjalankan container baru
                    echo "Running new container..."
                    sh 'docker run -d --name landing-page --rm -p 8000:80 landing-page-image:latest'
                }
            }
        }
    }
}