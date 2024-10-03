# MAC Address OUI Lookup Script

This Bash script allows users to fetch the **Organizationally Unique Identifier (OUI)** details for a list of MAC addresses from the [macaddress.io](https://macaddress.io) API. 

## Features
- Takes a list of MAC addresses from a text file.
- Queries the macaddress.io API for each MAC address.
- Outputs the MAC address along with the associated company name.

## Usage

1. Ensure you have an API key from [macaddress.io](https://macaddress.io).
2. Clone the repository and navigate to the directory:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git
   cd YOUR_REPOSITORY_NAME

3. Add a list of MAC addresses to a text file (one per line):
```txt
00:1A:2B:3C:4D:5E
00:1B:44:11:3A:B7
```
4. Run the script:
```bash
./get_oui.sh YOUR_API_KEY mac_addresses.txt
```
5. Output format:
```
MAC_ADDRESS:Company_Name
```
6. Requirements
- curl for making API requests.
- jq for parsing JSON output.
