# docker squid images


## Getting started

### Installation

You can pull the image.

```bash
   docker pull hackseal/squid:latest
```

Alternatively you can build the image yourself.

```bash
  docker build -t hackseal/squid:5.9  github.com/hackseal/docker-squid
```


## QuickStart

```bash
  # create dirs
  mkdir {logs, cache}
  docker run --name squid -d --restart=always \ 
     --publish 3128:3128 \
     --volume ./cache:/var/cache/squid
     --volume ./logs:/var/log/squid
     --volume ./config:/etc/squid

```

## docker-compose 

Start squid:
```bash
   docker compose up -d
```

Stop squid:
```bash
   docker compose down
```



## Usage

You can set Linux proxy to use squid.

```bash
  export ftp_proxy=http://172.17.0.1:3128
  export http_proxy=http://172.17.0.1:3128
  export https_proxy=http://172.17.0.1:3128
```
