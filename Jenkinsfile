node('ben') {
   withEnv([
      'DEVICE=zerofltexx',
      'BRANCH=lineage-17.1',
      'ROMTYPE=unofficial',
      'SYSTEM_PATH=/home/benlue/android/lineage',
      'OUTPUT_PATH=/home/benlue/android/lineage/out/target/product',
      /* 'DEV_UL_SCRIPT=https://raw.githubusercontent.com/los-legacy/zerofltexx/lineage-17.1/zerofltexx_upload_script.sh', */
      'DEV_UL_SCRIPT=https://raw.githubusercontent.com/los-legacy/',
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
            ls -lah ${SYSTEM_PATH}/
         """
      }
      stage('RepoSync') { // for display purposes
         sh """#!/bin/bash
            set +e
            cd ${SYSTEM_PATH}
	    export PATH=~/bin:$PATH
	    git config --global user.name 'Jenkins'
	    git config --global user.email 'jenkins@s3root.ovh'
	    repo init -u https://github.com/LineageOS/android.git -b ${BRANCH}
	    mkdir -p ${LOCAL_MANIFESTS_PATH}
	    rm -rf ${SYSTEM_PATH}/${LOCAL_MANIFESTS_PATH}/*
            wget ${LOCAL_MANIFESTS_URL} -O ${SYSTEM_PATH}/${LOCAL_MANIFESTS_PATH}/zero.xml
	    #wget ${DEV_UL_SCRIPT} -O ${SYSTEM_PATH}/${DEVICE}_upload_script.sh
	    wget ${DEV_UL_SCRIPT}/${DEVICE}/${BRANCH}/${DEVICE}_upload_script.sh -O ${SYSTEM_PATH}/${DEVICE}_upload_script.sh
	    #repo sync --no-clone-bundle --force-sync
         """
      }
      stage('Build') { // for display purposes
         sh """#!/bin/bash
            set +e
            cd ${SYSTEM_PATH}
            export PATH=~/bin:$PATH
            make clean
            source build/envsetup.sh
            breakfast ${DEVICE}
            #brunch ${DEVICE}
         """
      }
      stage('OTA Upload') { // for display purposes
	  /* 
	  sh """#!/bin/bash
            set +e
	    cd ${SYSTEM_PATH}
	    export PATH=~/bin:$PATH
            
	    source publish_${DEVICE}.sh
	    printenv
          """
	  */
	  sh '''#!/bin/bash
	    set +e
	    if [ -z $@ ]; then
		export TARGET_DATE=$(date +"%Y%m%d");
	    else
	 	export TARGET_DATE=$@;
	    fi 
	    date=$(date '+%Y%m%d');
            echo "Upload ${BRANCH}-$TARGET_DATE-${ROMTYPE}-${DEVICE}.zip to OTA"
	    echo ${foo}
	  '''
      }
   }
}
