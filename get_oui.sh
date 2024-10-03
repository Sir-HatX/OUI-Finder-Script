#!/bin/bash

# Ensure an API key and file are provided
if [ $# -lt 2 ]; then
  echo "Usage: $0 <API_KEY> <MAC_ADDRESS_FILE>"
  exit 1
fi

API_KEY=$1
MAC_ADDRESS_FILE=$2

# Check if the file exists
if [ ! -f "$MAC_ADDRESS_FILE" ]; then
  echo "File not found: $MAC_ADDRESS_FILE"
  exit 1
fi

# Loop through each MAC address in the file
while IFS= read -r MAC_ADDRESS; do
  # Skip empty lines
  if [[ -z "$MAC_ADDRESS" ]]; then
    continue
  fi

  # Use curl to query the macaddress.io API
  response=$(curl -s "https://api.macaddress.io/v1?apiKey=$API_KEY&output=json&search=$MAC_ADDRESS")
  
  # Check if the response is valid
  if [ $? -eq 0 ]; then
    # Extract the company name from the JSON response using jq
    COMPANY=$(echo "$response" | jq -r '.vendorDetails.companyName')
    
    if [ "$COMPANY" != "null" ]; then
      # Print in the format MAC Address:Company
      echo "$MAC_ADDRESS	$COMPANY"
    else
      echo "$MAC_ADDRESS:Company not found"
    fi
  else
    echo "$MAC_ADDRESS:Failed to retrieve data"
  fi

done < "$MAC_ADDRESS_FILE"

