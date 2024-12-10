# status-overlay
Creates Kometa show status YAML files and updates dates. 

## Docker Setup
```YAML
services:
  status-overlay:
    image: dweagle/status-overlay:latest
    container_name: status-overlay
    user: 1000:1002
    environment:
      - TZ=America/New_York
      - SCHEDULE=06:00  # Schedule run time
      - RUN_NOW:false   # true will bypass the schedule once on container startup
    volumes:
      # Mount your local directory to the containers internal config folder.
      # By default, the logs, settings, and overlays will be created here.
      - /path/to/status-overlay/config:/config:rw 
      # If you want overlay files to go to a seperate folder, ex. inside kometa, do
      # another mount to the save folder you entered in the settings (overlay_save_folder:)
      # Make sure the path matches the settings file path.
      - /path/to/kometa/overlays:/path/to/kometa/overlays:rw
    restart: unless-stopped  
```
## Manual Run
If you are doing testing on your overlay settings and don't want to restart the container
multiple times or set the env RUN_NOW variable to true, you can connect to the running 
container and run the following command.  It will run the main.py script and do a complete run.
```ruby
python3 main.py
```

## Default Settings File
```YAML
# TMDB_Discover settings pull series info to find air dates, etc.  Using the default settings
# limits the "junk" show results that are pulled for a library with mainly US, English language shows.  
# You will get less "No TVDB/TMDB id" errors in Kometa.

# If you have an anime library or a TV show library with lots of non English shows, it may be best
# to NOT use watch_region or with_original_language settings.

libraries:                          # Plex library (SHOWS ONLY) names to create Kometa overlays for.
  TV Shows:                         # Change, add, or remove - Need at least one library.
    is_anime: False                 # Removes TMDB with_original_language:'en' setting for use with Anime libraries or libraries with non English shows.         
    use_watch_region: True          # Removes TMDB watch_region and watch_monetization settings.
  4k TV Shows:
    is_anime: False
    use_watch_region: True
  Anime:
    is_anime: True
    use_watch_region: True

# These settings are used across all status overlays.  
# This creates a consistent overlay across all shows.    
overlay_settings:                  
  days_ahead: 28                            # Days ahead for Returning Next (30 Days Max).
  overlay_save_folder:                      # Kometa overlay folders (leave blank for script folder).
  font:                                     # Kometa must have permissions for this folder. Will default to included font in 'scriptparentfolder/fonts/Inter-Medium.ttf'.
  font_size: 45                             # Font size for overlay text.
  font_color: "#FFFFFF"                     # Font color (kometa requires #RGB, #RGBA, #RRGGBB or #RRGGBBAA, e.g., #FFFFFF).
  horizontal_align: center                  # Horizontal alignment (e.g., center, left, right).
  vertical_align: top                       # Vertical alignment (e.g., top, bottom, etc.).
  horizontal_offset: 0                      # Horizontal offset in pixels.
  vertical_offset: 38                       # Vertical offset in pixels.
  back_width: 475                           # Width of the overlay background.
  back_height: 55                           # Height of the overlay background.
  back_radius: 30                           # Corner radius for rounded backgrounds.
  ignore_blank_results: "true"              # Kometa error processing (true or false).

  # TMDB DISCOVER SETTINGS #                SEE TMDB API FOR MORE DETAILS - THESE SETTINGS ARE IDEAL.
  timezone: America/New_York                # TMDB DISCOVER - UTC timezone standards (default American/New_York).
  with_status: 0                            # TMDB DISCOVER - Returning Series: 0 Planned: 1 In Production: 2 Ended: 3 Canceled: 4 Pilot: 5.
  watch_region: US                          # TMDB DISCOVER - Default US - Must be valid TMDB region code.
  with_original_language: en                # TMDB DISCOVER - Default is en (English) - Must Be valid TMDB language code.
  limit: 500                                # TMDB DISCOVER - API Results limit. Default is 500.
  with_watch_monetization_types: flatrate|free|ads|rent|buy  # TMDB DISCOVER - Options: flaterate, free, ads, rent, buy - can use ,(and) or |(or) as separators.

# You can decide here if you want to use each overlay, change font or backdrop color for individual overlays, or change the text.
use_overlays:
  upcoming_series:
    use: True                               # Use this overlay: True or False.
    back_color: "#FC4E03"                   # Default is "#fc4e03" - Overlay color override for this overlay only.
    text: "U P C O M I N G"                 # Change to desired spacing/text.
    font_color: "#FFFFFF"                   # font color override for this overlay only (Kometa requires #RGB, #RGBA, #RRGGBB or #RRGGBBAA).
    
  new_series:
    use: True
    back_color: "#008001"                   # Default is "#008001".
    text: "N E W  S E R I E S"
    font_color: "#FFFFFF"

  new_airing_next:
    use: True
    back_color: "#008001"                   # Default is "#008001".
    text: "N E W - A I R S"                 # Displays as N E W - A I R S 12/22 on overlays.
    font_color: "#FFFFFF"

  airing_series:
    use: True
    back_color: "#003880"                   # Default is "#003880".
    text: "A I R I N G"
    font_color: "#FFFFFF"

  airing_today:
    use: True
    back_color: "#003880"                   # Default is "#003880".
    text: "A I R S  T O D A Y"
    font_color: "#FFFFFF"

  airing_next:
    use: True
    back_color: "#003880"                   # Default is "#003880".
    text: "A I R I N G "                    # Displays as A I R I N G  12/23 on overlays.
    font_color: "#FFFFFF"

  ended_series:
    use: True
    back_color: "#000000"                   # Default is "#000000.
    text: "E N D E D"
    font_color: "#FFFFFF"

  canceled_series:
    use: True
    back_color: "#CF142B"                   # Default is "#CF1428".
    text: "C A N C E L E D"
    font_color: "#FFFFFF"

  returning_series:
    use: True
    back_color: "#103197"                   # Default is "#103197".
    text: "R E T U R N I N G"
    font_color: "#FFFFFF" 

  returns_next:
    use: True
    back_color: "#103197"                   # Default is "#103197"
    text: "R E T U R N S "                  # Displays as R E T U R N S  12/23 on overlays.
    font_color: "#FFFFFF"
```     
