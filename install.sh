#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any dev container 'features' in this repository. 
#
# The tooling will parse the devcontainer-features.json + user devcontainer, and write 
# any build-time arguments into a feature-set scoped "devcontainer-features.env"
# The author is free to source that file and use it however they would like.
set -a
. ./devcontainer-features.env
set +a


if [ ! -z ${_BUILD_ARG_GOOGLE_CLOUD_SDK} ]; then
    # Ex. google-cloud-sdk-369.0.0-Linux-x86_64
    file="google-cloud-sdk-${_BUILD_ARG_GOOGLE_CLOUD_SDK_VERSION}-$(uname)-$(uname -m)"
    
    echo "Downloading and extracting ${file}..."
    curl -o google-cloud-sdk.tar.gz "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${file}.tar.gz"

    echo "Extracting ${file}..."
    tar -xvf ./google-cloud-sdk.tar.gz

    echo "Installing ${file}..."
    mv ./google-cloud-sdk /usr/local/share/google-cloud-sdk
    /usr/local/share/google-cloud-sdk/install.sh --quiet --path-update=true

    echo "Installed ${file}"
fi


if [ ! -z ${_BUILD_ARG_GOOGLE_CLOUD_SQL_AUTH_PROXY} ]; then
    # Ex. cloud_sql_proxy.Linux.amd64
    file="cloud_sql_proxy.$(uname).$(dpkg --print-architecture)"

    echo "Downloading ${file}..."
    curl -o cloud_sql_proxy "https://dl.google.com/cloudsql/${file}"
    chmod +x ./cloud_sql_proxy
    mv ./cloud_sql_proxy /usr/local/bin/cloud_sql_proxy
    
    echo "Installed ${file}"
fi
