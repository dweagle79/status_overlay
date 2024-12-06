import os
import subprocess
import sys

# Define the path to the scripts folder
scripts_folder = os.path.join(os.path.dirname(__file__), 'scripts')
main_script = os.path.join(scripts_folder, 'main.py')

# Run the main.py script
try:
    subprocess.run([sys.executable, main_script], check=True)
except subprocess.CalledProcessError as e:
    print(f"Error running {main_script}: {e}")
