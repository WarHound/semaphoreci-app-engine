#!/bin/bash

export PATH=$SEMAPHORE_CACHE_DIR/google-cloud-sdk/bin:$PATH

if [ ! -f "$SEMAPHORE_CACHE_DIR/google-cloud-sdk/bin/gcloud" ]
then
  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$VERSION-linux-x86_64.tar.gz
  tar -x -C $SEMAPHORE_CACHE_DIR -f google-cloud-sdk-$VERSION-linux-x86_64.tar.gz
  gcloud --quiet components update --version $VERSION
fi

gcloud auth activate-service-account --key-file=/home/runner/auth_key.json

gcloud app deploy --quiet
