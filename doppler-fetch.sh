#!/bin/bash

# Set the project path in Doppler
PROJECT_PATH="development/dev/dev_personal"

# Output INI files
ANSIBLE_INI_FILE="ansible/credentials.ini"
CLOUDFLARE_INI_FILE="terraform/cloudflare.auto.tfvars"
PROXMOX_INI_FILE="terraform/proxmox.auto.tfvars"

#
# ? Ansible INI file
#

# Fetch the secrets using Doppler CLI (make sure you're authenticated)
echo "Fetching secrets from Doppler project: $PROJECT_PATH"
doppler secrets --only-names --json > fields.json

# Check if the file was created successfully
if [[ ! -f "fields.json" ]]; then
  echo "Error: Unable to fetch secrets from Doppler."
  exit 1
fi

my_array=( $(doppler secrets --only-names --json | jq -r 'keys[]') )
for key in "${my_array[@]}"; do
    lowercase_string="${key,,}"
    echo "${lowercase_string}"
    doppler secrets get "${key}" --plain
done

# Create the INI file (overwrite if exists)
echo "Writing secrets to $INI_FILE..."
echo "[credentials]" > "$INI_FILE"

# Read the JSON file and write each key-value pair to the INI file
jq -r 'to_entries | .[] | "\(.key)=\(.value)"' secrets.json >> "$INI_FILE"

# Clean up
rm secrets.json
echo "Done. Ansible credentials written to $INI_FILE."

#
# ? Cloudflare INI file
#

# Clean up
rm secrets.json
echo "Done. Cloudflare credentials written to $INI_FILE."

#
# ? Proxmox INI file
#

# Clean up
rm secrets.json
echo "Done. Proxmox credentials written to $INI_FILE."
