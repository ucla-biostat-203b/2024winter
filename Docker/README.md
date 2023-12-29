## Build images for different platforms

Build image for `amd64` architecture (e.g., Intel/AMD):
```bash
docker build -f Dockerfile.amd64 --platform linux/amd64 --tag huazhou/ucla_biostat_203b_2024w:manifest-amd64 .
```

Build image for `arm64` architecture (e.g., Apple M1/M2/M3):
```bash
docker build -f Dockerfile.arm64 --platform linux/arm64 --tag huazhou/ucla_biostat_203b_2024w:manifest-arm64 .
```

## Push images

Push images to Docker Hub:
```bash
docker push huazhou/ucla_biostat_203b_2024w:manifest-amd64
```
or
```bash
docker push huazhou/ucla_biostat_203b_2024w:manifest-amd64
```

## Create manifest (not working)

```bash
docker manifest create --insecure huazhou/ucla_biostat_203b_2024w:manifest-latest huazhou/ucla_biostat_203b_2024w:manifest-arm64 huazhou/ucla_biostat_203b_2024w:manifest-amd64
```

```bash
docker manifest push huazhou/ucla_biostat_203b_2024w:manifest-latest
```

## Run image

Modify `docker-compose.yml` to map `203-lecture`, `203-hw`, and `mimic` folders on local machine to container.
```bash
docker-compose up
```
