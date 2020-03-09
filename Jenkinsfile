node('ben') {
   withEnv(['DEVICE=zerofltexx', 'BRANCH=lineage-17.1']) {
      stage('Preparation') { // for display purposes
         print env.DEVICE
         sh "cd /home/benlue/android/lineage; ls -lah"
      }
      stage('RepoSync') { // for display purposes
         echo "RepoSync"
         print env.BRANCH
      }
      stage('Build') { // for display purposes
         echo "Build"
      }
      stage('OTA Upload') { // for display purposes
         echo "Upload"
      }
   }
}
