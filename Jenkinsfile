node('ben') {
   withEnv(['TEST=test', AUTO=auto']) {
      stage('Preparation') { // for display purposes
         print env.TEST
         sh "cd /home/benlue/android/lineage; ls -lah"
      }
      stage('RepoSync') { // for display purposes
         echo "RepoSync"
         print env.AUTO
      }
      stage('Build') { // for display purposes
         echo "Build"
      }
      stage('OTA Upload') { // for display purposes
         echo "Upload"
      }
   }
}
