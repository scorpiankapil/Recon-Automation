# crtsh_enum.sh

## 🔍 Overview
* crtsh_enum.sh is a subdomain enumeration script
* It uses Certificate Transparency logs from crt.sh
* Helps discover subdomains of a target domain automatically

## ⚙️ Features
Takes user input (target domain & output file)
Fetches subdomains from crt.sh
Cleans data:
Removes wildcard entries (*.domain.com)
Converts to lowercase
Removes duplicates
Saves results in a .txt file

## 🎯 Use Cases
Bug bounty reconnaissance
Penetration testing
Attack surface discovery
Finding hidden or forgotten subdomains
