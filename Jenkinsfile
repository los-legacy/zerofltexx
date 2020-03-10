node('ben') {
   withEnv([
      'DEVICE=zerofltexx', 
      'SYSTEM_PATH=/home/benlue/android/lineage',
      'DEV_UL_SCRIPT=https://raw.githubusercontent.com/los-legacy/zerofltexx/lineage-17.1/$DEVICE_upload_script.sh',
      'LOCAL_MANIFESTS_URL=https://raw.githubusercontent.com/los-legacy/local_manifests/lineage-17.1/zero.xml',
      'LOCAL_MANIFESTS_PATH=.repo/local_manifests', 
   ]) {
      stage('Preparation') { // for display purposes
         sh """#!/bin/bash
            set +e
            rm -rf $env.SYSTEM_PATH/$env.LOCAL_MANIFESTS_PATH/*
            wget $env.LOCAL_MANIFESTS_URL -O $env.SYSTEM_PATH/$env.LOCAL_MANIFESTS_PATH/zero.xml
	    wget $env.DEV_UL_SCRIPT -O $env.SYSTEM_PATH/zerofltexx_upload_script.sh
            ls -lah $env.SYSTEM_PATH/
         """
      }
      stage('RepoSync') { // for display purposes
         sh """#!/bin/bash
            set +e
            cd $env.SYSTEM_PATH
            export PATH=~/bin:$PATH
            #repo sync --no-clone-bundle --force-sync
         """
      }
      stage('Build') { // for display purposes
         sh """#!/bin/bash
            set +e
            cd $env.SYSTEM_PATH
            export PATH=~/bin:$PATH
            #make clean
            source build/envsetup.sh
            #breakfast $env.DEVICE
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
