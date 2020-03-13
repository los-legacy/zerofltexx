node('ben') {
   withEnv([
      'DEVICE=zerofltexx',
      'BRANCH=lineage-17.1', 
      'SYSTEM_PATH=/home/benlue/android/lineage',
      'DEV_UL_SCRIPT=https://raw.githubusercontent.com/los-legacy/zerofltexx/lineage-17.1/zerofltexx_upload_script.sh',
      'LOCAL_MANIFESTS_URL=https://raw.githubusercontent.com/los-legacy/local_manifests/lineage-17.1/zero.xml',
      'LOCAL_MANIFESTS_PATH=.repo/local_manifests', 
   ]) {
      stage('Preparation') { // for display purposes
         sh """#!/bin/bash
            set +e
	    export PATH=~/bin:$PATH
	    mkdir -p ~/bin
	    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
	    chmod a+x ~/bin/repo
            ls -lah $env.SYSTEM_PATH/
         """
      }
      stage('RepoSync') { // for display purposes
         sh """#!/bin/bash
            set +e
            cd $env.SYSTEM_PATH
	    export PATH=~/bin:$PATH
	    git config --global user.name 'Jenkins'
	    git config --global user.email 'jenkins@s3root.ovh'
	    repo init -u https://github.com/LineageOS/android.git -b ${BRANCH}
	    mkdir -p $env.LOCAL_MANIFESTS_PATH
	    rm -rf $env.SYSTEM_PATH/$env.LOCAL_MANIFESTS_PATH/*
            wget $env.LOCAL_MANIFESTS_URL -O $env.SYSTEM_PATH/$env.LOCAL_MANIFESTS_PATH/zero.xml
	    wget $env.DEV_UL_SCRIPT -O ${SYSTEM_PATH}/${DEVICE}_upload_script.sh
	    #repo sync --no-clone-bundle --force-sync
         """
      }
      stage('Build') { // for display purposes
         sh """#!/bin/bash
            set +e
            cd $env.SYSTEM_PATH
            export PATH=~/bin:$PATH
            make clean
            source build/envsetup.sh
            breakfast $env.DEVICE
            #brunch $env.DEVICE 
         """
      }
      stage('OTA Upload') { // for display purposes
	  sh """#!/bin/bash
            set +e
	    cd $env.SYSTEM_PATH
            source publish_rom.sh
	    #printenv
          """
      }
   }
}
