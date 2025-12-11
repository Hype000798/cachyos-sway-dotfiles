#!/usr/bin/env python3

import sys
import json
import time
import threading
import subprocess


def is_process_running(name):
    """Check if a process with given name is currently running."""
    try:
        subprocess.check_output(["pgrep", "-x", name])
        return True
    except subprocess.CalledProcessError:
        return False


def get_player_status(player_name=None):
    """Get media player status using playerctl."""
    cmd = ["playerctl", "metadata", "--format", "{{status}}||{{artist}}||{{title}}||{{album}}"]
    
    if player_name:
        cmd.insert(1, "-p")
        cmd.insert(2, player_name)
    
    try:
        output = subprocess.check_output(cmd).decode("utf-8").strip().split("||")
        if len(output) >= 4:
            status, artist, title, album = output
            return {
                "status": status.lower(),
                "artist": artist if artist != "" else "Unknown Artist",
                "title": title if title != "" else "Unknown Title",
                "album": album if album != "" else "Unknown Album"
            }
    except subprocess.CalledProcessError:
        pass
    except FileNotFoundError:
        print("playerctl not found", file=sys.stderr)
    
    return None


def main():
    def get_media_info():
        player_name = sys.argv[1] if len(sys.argv) > 1 else None
        
        while True:
            # Check if any player is active
            player_info = None
            
            # If player name is specified, check only that player
            if player_name:
                if is_process_running(player_name) or is_process_running("playerctld"):
                    player_info = get_player_status(player_name)
            else:
                # Check all players
                if is_process_running("spotify") or is_process_running("vlc") or is_process_running("firefox") or is_process_running("chromium"):
                    player_info = get_player_status()
            
            if player_info:
                # Determine icon based on player name
                icon = "🎜"
                if player_name == "spotify":
                    icon = ""
                
                # Format the output
                output = {
                    "text": f"{icon} {player_info['artist']} - {player_info['title']}",
                    "tooltip": f"{player_info['artist']} - {player_info['title']}\nAlbum: {player_info['album']}\nStatus: {player_info['status']}",
                    "class": f"custom-{player_name}" if player_name else "custom-media"
                }
                
                print(json.dumps(output))
            else:
                # No player active, show nothing
                output = {
                    "text": "",
                    "tooltip": "No media playing",
                    "class": "custom-media"
                }
                
                print(json.dumps(output))
            
            time.sleep(1)
    
    get_media_info()


if __name__ == "__main__":
    main()