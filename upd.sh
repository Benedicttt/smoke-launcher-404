# sudo rm -rf /Users/benedict/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle
# sudo  touch /Users/benedict/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle
# sudo chown root /Users/benedict/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle
# sudo chmod 644 /Users/benedict/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle

ga . && gcmsg 'fix' && gp auto && gp origin
