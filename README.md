# status_overlay
Creates Kometa show status YAML files and updates dates. 

Docker Setup
```
services:
  status-overlay:
    image: ghcr.io/dweagle79/status-overlay:latest
    container_name: status-overlay
    environment:
      - SCHEDULE=06:00  # Schedule run time
      - RUN_NOW:true    # Will bypass the schedule once on container startup
    volumes:
      - /path/to/status-overlay/config:/config:rw
    restart: unless-stopped  
```
