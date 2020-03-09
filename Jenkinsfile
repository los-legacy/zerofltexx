node('ben') {
   withEnv(['DEVICE=zerofltexx', 'LOS_PATH=/home/benlue/android/lineage', 'BRANCH=lineage-17.1']) {
      stage('Preparation') { // for display purposes
         print env.DEVICE
         sh "cd /home/benlue/android/lineage; ls -lah"
      }
      stage('RepoSync') { // for display purposes
         echo "RepoSync"
         print env.LOS_PATH
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
