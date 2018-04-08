#!/usr/bin/env bash
set -eo pipefail

# Print a usage message and exit.
usage() {
	cat >&2 <<-'EOF'
	Usage: ./release.sh
	
	To run, I need:
	- to be provided with the name of the resource group these assets live in, in environment variable AZURE_RG_NAME
	- to be provided with Azure credentials for the container, in environment variables AZURE_STORAGE_ACCOUNT and AZURE_STORAGE_KEY
	EOF
	exit 1
}

echo "Building site with hugo"
hugo

if [ ! -d public ]; then
	echo "Something went wrong. public/ should exist."
fi

[ "$AZURE_RG_NAME" ] || usage
[ "$AZURE_STORAGE_ACCOUNT" ] || usage
[ "$AZURE_STORAGE_KEY" ] || usage

# upload the files at the root directory to the root container
dir="public"
files=$(ls -p ${dir})
az storage container create -n '$root' --public-access container
for i in $(echo "${files}" | grep -v /); do
	az storage blob upload -f "${dir}/$i" -n "$i" -c '$root'
done
# upload the rest to their respective containers
for i in $(echo "${files}" | grep /); do
	AZURE_CONTAINER="$(echo $i | sed 's:/*$::')"
	az storage container create -n "${AZURE_CONTAINER}" --public-access container
	az storage blob upload-batch --source "${dir}/$i" --destination "${AZURE_CONTAINER}"
done
