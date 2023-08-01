1. Follow the guidelines from here: https://pimylifeup.com/raspberry-pi-portainer/ \
```sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest```
   * Also, install docker: https://pimylifeup.com/raspberry-pi-docker/ \
   ```curl -sSL https://get.docker.com | sh```