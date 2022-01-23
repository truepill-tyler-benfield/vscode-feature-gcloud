> ⚠️ NOTE: This functionality is in PREVIEW. Please note it is subject to (heavy) modification!

# Google Cloud Development Container Features

## Features In This Repo

### Install Google Cloud SDK

This feature will install the [Google Cloud SDK](https://cloud.google.com/sdk/) at the specified version, or the latest if no version is specified.

### Install Google Cloud SQL Auth Proxy

This feature will install the [Google Cloud SQL Auth Proxy](https://cloud.google.com/sql/docs/mysql/sql-proxy) at the specified version, or the latest if no version is specified.

## Release Flow

Push a tag (eg `v0.0.1`) to your repo, which will trigger the [deploy-features action](https://github.com/microsoft/publish-dev-container-features-action) in this repo's [`deploy-features.yml` workflow file](https://github.com/microsoft/dev-container-features-template/blob/main/.github/workflows/deploy-features.yml).

Assets will be compressed and added as a release artifact with the name `features.tgz`.

## Include these features in your project's devcontainer

To include your feature in a project's devcontainer, provide the following `features` like so.

```jsonc
"image": "mcr.microsoft.com/vscode/devcontainers/base",
features: {
    "truepill-tyler-benfield/vscode-feature-gcloud/google-cloud-sdk": "369.0.0",
    "truepill-tyler-benfield/vscode-feature-gcloud/google-cloud-sql-auth-proxy": "latest"
}
```

Providing no version implies the latest release's artifacts. To supply a tag as a version, use the following notation.

```jsonc
features: {
    "truepill-tyler-benfield/vscode-feature-gcloud/google-cloud-sdk@v0.0.1": "369.0.0"
}
```
