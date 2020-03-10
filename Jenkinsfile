node('ben') {
   withEnv([
      'DEVICE=zerofltexx', 
      'SYSTEM_PATH=/home/benlue/android/lineage',
      'OUTPUT_PATH=$env.SYSTEM_PATH/out/target/product/$env.DEVICE',
      'FILENAME=lineage-17.1-$TARGET_DATE-UNOFFICIAL-$env.DEVICE.zip',
      'SEARCH_FILENAME=lineage-17.1-$TARGET_DATE-UNOFFICIAL-$env.DEVICE.zip',
      'ROMTYPE="unofficial',
      'VERSION=17.1',
      'LOCAL_MANIFESTS_URL=https://raw.githubusercontent.com/los-legacy/local_manifests/lineage-17.1/zero.xml',
      'LOCAL_MANIFESTS_PATH=.repo/local_manifests', 
   ]) {
      stage('Preparation') { // for display purposes
         sh """#!/bin/bash
            set +e
            rm -rf $env.SYSTEM_PATH/$env.LOCAL_MANIFESTS_PATH/*
            wget $env.LOCAL_MANIFESTS_URL -O $env.SYSTEM_PATH/$env.LOCAL_MANIFESTS_PATH/zero.xml
            ls -lah $env.SYSTEM_PATH/$env.LOCAL_MANIFESTS_PATH/
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
         sh '''#!/bin/bash
            set +e
	    cd $SYSTEM_PATH
            if [ -z $@ ]; then
		export TARGET_DATE=$(date +"%Y%m%d");
	    else
		export TARGET_DATE=$@;
	    fi 
	    echo $OUTPUT_PATH
	    echo $FILENAME
	    echo $SEARCH_FILENAME
         '''
      }
   }
}
