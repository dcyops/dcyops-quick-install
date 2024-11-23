#!/usr/bin/env python3

import sys
import re
import subprocess
import dbus
import time

def convert_to_uri(url):
    pattern = r'https?://open\.spotify\.com/([a-z]+)/([a-zA-Z0-9]+)'
    match = re.match(pattern, url)
    
    if match:
        content_type, content_id = match.groups()
        return f'spotify:{content_type}:{content_id}'
    return None

def open_spotify_uri(uri):
    try:
        bus = dbus.SessionBus()
        spotify = bus.get_object('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2')
        interface = dbus.Interface(spotify, 'org.mpris.MediaPlayer2.Player')
        interface.OpenUri(uri)
        return True
    except dbus.exceptions.DBusException:
        return False

def main():
    if len(sys.argv) != 2:
        print("Usage: spotify-url-handler.py <spotify-url>")
        sys.exit(1)

    url = sys.argv[1]
    uri = convert_to_uri(url)
    
    if uri:
        # Try to open URI via DBus first
        if not open_spotify_uri(uri):
            # If DBus fails, start Spotify
            subprocess.Popen(['spotify'])
            time.sleep(3)  # Wait for Spotify to start
            # Try DBus again
            if not open_spotify_uri(uri):
                print("Failed to open URI in Spotify")
                sys.exit(1)
    else:
        print(f"Invalid Spotify URL: {url}")
        sys.exit(1)

if __name__ == "__main__":
    main()

