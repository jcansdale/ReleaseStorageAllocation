# Release Orphaned Storage

The script can be used like this

```
GITHUB=TOKEN=<PAT>      # PAT with repo, read:packages, write:packages and delete:packages scopes
REPOSITORY=<OWNER/REPO> # Repository with associated storage
FREE_GB=<NUMBER>        # Number of GB to free
bash <(curl -Lks https://raw.githubusercontent.com/jcansdale/ReleaseStorageAllocation/master/free.sh) $REPOSITORY $FREE_GB $GITHUB_TOKEN
```
