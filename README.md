# status_overlay
Creates Kometa show status YAML files and updates dates. 

Kometa Show Status Overlay YML Creator by dweagle79 (inspired by PATTRMM)

This script will create show status overlay yaml files that Kometa can use to create upcoming, new, airing, ended, canceled and returning status overlays
on your Plex posters. I place this script folder in my Kometa directory and set a cron/task that runs the runstatus.py script daily and prior to Kometa running.

1.  Move the script folder to your desired location.  I put mine in my Kometa directory. If you do this then Kometa will
already have permissions to access the font and created yaml files since they are in the Kometa folders. If you don't want the folder in your Kometa directory, 
you can set the 'overlay_save_folder:" line in the settings file to output the yaml files to your kometa directory or a directory of your choosing.

2. For the initial setup, run the run_status.py script manualy. It will do a quick run and exit.  It will create an 'overlay-settings.yml' file where you can edit a variety of Kometa settings. It also creates and keeps 5 logs in a logs folder in the script folder.  See the default settings file below for more info. If you leave all settings to the initially created defaults, you will get a fully functional overlay.  It will create a fresh settings file. If you change settings and they are incorrect, the validation module of the scripts will give you warnings and errors on subsequent runs.  Outside of the structure of the settings file, the yaml creation will revert to defaults if you incorrectly change settings or include wrong formats.  If you mess up the settings file beyond repaair, just delete it and run the script again. 

3. See the 'libraries:' section - These are the names of your Plex libraries that you are making the overlay ymls for.  They must be TV Shows or Anime libraries. Movies don't use status in Kometa.  You must have at least one library listed.  You can delete the other default created ones.  Each library section must have a 'is_anime' and 'use_watch_region' attribute. set to True/False.  See the example below 
for more info.

4. The 'overlay_save_folder' and 'font:' settings are really the only other settings you may want to adjust.  
    'font:' - This is the file path that tells Kometa where to access the font file to use on the overlays. This path will be added in the overlay files.
    I've included a font file that looks great and if you leave the 'font:' setting blank, the created yaml files will default to this font path.
        
    'overlay_save_folder:' This is where the script will create the overlay ymls.  If you leave this blank, the script will create them in the main script folder.
    You can enter a path here and it will save them to that location.  You must edit your Kometa config to use the overlay files and paths.

5.  See the 'overlay_settings:' section - Play around with this section to create your overlays. These settings will apply to all overlays. If you leave everything at these default settings, you will have a nice looking overlay out of the box.  If you edit these settings and delete some by accident or input invalid values, don't worry! The script will also help you validate the entries when it runs again.  It will stop the script, or throw warning messages if you set it up wrong. 'overlay_settings:" attributes will revert to the default settings if you leave them blank.

6.  See the 'use_overlays:' section - This section allows you to turn off/on different overlays by setting 'use:' to True or False.  The default settings here will give you a nice overlay.  If you want, you can edit font color, back color, or text for individual overlays here.

7.  After you get everything set just how you want, run the script a second time.  This time it will detect the created settings file, use these settings and create a overlay yml for each library you have listed in the libraries section.  The files will be named after the library names.  These files can then be used by Kometa.

8.  Now, set up a task schedule or cron job to run this run_status.py script on a schedule.   It's good to run daily and prior to your scheduled Kometa run to update the dates daily. It will overwrite the created yamls with the fresh dates on each days run.  See Kometa requirements to run these yamls.  
