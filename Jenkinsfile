node('ben') {
   wihtEnv(['value = World']) {
      stage('Preparation') { // for display purposes
         print env.HELLO
         sh "cd /home/benlue/android/lineage; ls -lah"
      }
      stage('RepoSync') { // for display purposes
         echo "RepoSync"
      }
      stage('Build') { // for display purposes
         echo "Build"
      }
      stage('OTA Upload') { // for display purposes
         echo "Upload"
      }
   }
}
