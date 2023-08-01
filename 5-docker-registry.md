1. kubectl create namespace docker-registry
2. Ensure the ```docker``` entrypoint has been set in the static config. See the [traefik-static-config.yaml](k3s/traefik-static-config.yaml)!
3. Run the kubernetes yml files under the docker-registry folder to add the
    * registry
    * access via IngressRouteTCP
4. Add the docker-registry in portainer
   * It will be available at: ```{host}:9999```

## Add registry to Docker Desktop
Find the Docker Engine setting and add the path to your docker-registry at the ```"insecure-registries``` in the json editor. Mine looks like this:
```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "debug": true,
  "experimental": false,
  "features": {
    "buildkit": true
  },
  "insecure-registries": [
    "{host}:9999",
    "localhost:5000"
  ]
}
```

## Add registry to Portainer
https://docs.portainer.io/admin/registries/add/custom

## Test the new registry
Download and re-tag an image.

E.g.: run these commands on your PC:
1. ```docker pull traefik/whoami```
2. ```docker tag traefik/whoami:latest {host}:9999/ping```
3. ```docker push {host}:9999/ping```
4. ```curl {host}:9999/v2/_catalog``` => you should see the "ping" repository!



