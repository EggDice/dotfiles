#!/bin/sh

# Check if Terminal has Full Disk Access
if ! tccutil check "com.apple.Terminal" "system.filesystem"; then
    # Prompt user to give Terminal Full Disk Access
    osascript -e 'display dialog "Please grant Full Disk Access to Terminal in the next window." buttons {"OK"} default button "OK"'
    osascript -e 'tell application "System Preferences"
                    activate
                    set current pane to pane id "com.apple.preference.security"
                    reveal anchor "Privacy_Accessibility" of pane id "com.apple.preference.security"
                  end tell'
    osascript -e 'display dialog "Please add Terminal to the list and grant it Full Disk Access. Then click OK." buttons {"OK"} default button "OK"'
else
    echo "Terminal already has Full Disk Access."
fi
