node('ben') {
   withEnv(['DEVICE=zerofltexx', 'LOS_PATH=/home/benlue/android/lineage', 'BRANCH=lineage-17.1']) {
      stage('Preparation') { // for display purposes
         print env.DEVICE
      }
      stage('RepoSync') { // for display purposes
         echo "RepoSync"
         sh "cd $env.LOS_PATH; export PATH=~/bin:$PATH; repo sync --no-clone-bundle --force-sync"
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
