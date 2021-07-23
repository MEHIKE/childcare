node('dind-node') {
  withMaven(maven:'M3') {
    stage('Checkout') {
      git url: 'https://github.com/MEHIKE/childcare.git', credentialsId: 'mehike', branch: 'master'
    }
    stage('Build') {
      dir('childcare') {
        sh 'mvn clean install'
        def pom = readMavenPom file:'pom.xml'
        print pom.version
        env.version = pom.version
        currentBuild.description = "Release: ${env.version}"
      }
    }
    stage('Image') {
      dir ('childcare') {
        docker.withRegistry('https://192.168.99.100:5000') {
          def app = docker.build "mehike/childcare:${env.version}"
          app.push()
        }
      }
    }
  }
}