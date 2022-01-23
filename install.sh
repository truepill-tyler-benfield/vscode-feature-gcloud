#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any features in this repository. 
#
# The tooling will parse the features.json + user devcontainer, and write 
# any build-time arguments into a feature-set scoped "features.env"
# The author is free to source that file and use it however they would like.
set -a
. ./features.env
set +a


if [ ! -z ${_BUILD_ARG_GOOGLE_CLOUD_SDK} ]; then
    echo "Downloading and extracting google-cloud-sdk package..."

    curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${_BUILD_ARG_GOOGLE_CLOUD_SDK_VERSION}.tar.gz \
        | tar xz

    echo "Installing google-cloud-sdk..."
    
    ./google-cloud-sdk/install.sh --quiet

    echo "Installed google-cloud-sdk"
fi


if [ ! -z ${_BUILD_ARG_GOOGLE_CLOUD_SQL_AUTH_PROXY} ]; then
    echo "Downloading cloud_sql_proxy package..."

    curl https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 cloud_sql_proxy
    chmod +x ./cloud_sql_proxy
    
    echo "Downloaded cloud_sql_proxy package"
fi
