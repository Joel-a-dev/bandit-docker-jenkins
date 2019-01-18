def getCommit(){
  return sh(returnStdout: true, script: "git rev-parse HEAD").trim()
}

def getBuildTimestamp(){
  return sh(returnStdout: true, script: "date +'%Y-%m-%dT%H:%M:%SZ'").trim()
}

def getVersion(){
  sh(script: "git fetch --tags")
  return sh(returnStdout: true, script: "git describe --tags --abbrev=0").toString().trim()
}

def run_bandit_test(){
  return_s= sh( returnStatus:true, script:"bash ${BANDIT_DOCKER_SCRIPT}")
}

def cleanDocker(){
  sh "echo WIP"
}

pipeline {
  agent any
  
  environment {
      INIT_GENERATOR_SCRIPT='generate-init-py.sh'
      BANDIT_DOCKER_SCRIPT='mount_bandit.sh'
      DOCKER_SETUP_SCRIPT='mount_bandit'
    }

  stages {
    stage("Initialization") {
      steps{
        // set variables and generate files
        sh "bash ${INIT_GENERATOR_SCRIPT}"
      }
    }
      stage("Bandit-Docker") {
        steps {

          run_bandit_test()

          script{
            bandit_status= sh( returnStatus:true, script:"bash ${DOCKER_SETUP_SCRIPT}")
            //echo "${bandit_status}"
            if ("${bandit_status}" != '0') {
              //publish results
              publishHTML (target: [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: './',
                reportFiles: 'shared/banditReport.html',
                reportName: "Bandit Report"
              ])
              error "Bandit test failed : (${env.BUILD_URL})"
            }
          }
        }
      }
  }
  // Post in Stage executes at the end of Stage instead of end of Pipeline
  post {
    always{
      deleteDir()
    }
    success {
      echo "UNSTABLE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    }
    unstable {
      echo "UNSTABLE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    }
    failure {
      echo "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    }
  }
}
