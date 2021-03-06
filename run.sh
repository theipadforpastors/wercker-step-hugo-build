#/bin/bash

if [ ! -n "$WERCKER_HUGO_BUILD_VERSION" ]; then
    export WERCKER_HUGO_BUILD_VERSION=0.12
fi

if [ ! -n "$WERCKER_HUGO_BUILD_FLAGS" ]; then
    WERCKER_HUGO_BUILD_FLAGS=""
fi
if [ -n "$WERCKER_HUGO_BUILD_THEME" ]; then
    WERCKER_HUGO_BUILD_FLAGS=$WERCKER_HUGO_BUILD_FLAGS" --theme="${WERCKER_HUGO_BUILD_THEME}
fi

cd $WERCKER_STEP_ROOT
wget --directory-prefix=${WERCKER_STEP_ROOT} https://github.com/spf13/hugo/releases/download/v${WERCKER_HUGO_BUILD_VERSION}/hugo_${WERCKER_HUGO_BUILD_VERSION}_linux_amd64.tar.gz
tar xzf hugo_${WERCKER_HUGO_BUILD_VERSION}_linux_amd64.tar.gz
${WERCKER_STEP_ROOT}/hugo_${WERCKER_HUGO_BUILD_VERSION}_linux_amd64/hugo_${WERCKER_HUGO_BUILD_VERSION}_linux_amd64 --source="${WERCKER_SOURCE_DIR}" ${WERCKER_HUGO_BUILD_FLAGS}