> [WARNING]
> WIP - heavily in progress!

## Manually
1. Configure Portainer to see the K3S -> https://rpi4cluster.com/k3s/k3s-portainer/
    * https://docs.portainer.io/admin/environments/add/kubernetes/agent
    * Follow the guidelines from here: https://pimylifeup.com/raspberry-pi-portainer/ \
      ```sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest```
