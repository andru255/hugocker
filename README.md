# GoHugo with docker

Docker image with hugo inside

## Inspired of amazing images/repos:

- [VictorJSV/docker-gulp](https://github.com/VictorJSV/docker-gulp)
- [jojomi/docker-hugo](https://github.com/jojomi/docker-hugo)

## Contains

[Alpine image](https://hub.docker.com/_/alpine/):v.3.6
[hugo](http://gohugo.io/): 0.30.2

## How to use

### creating a site

```
docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/:/usr/local/share/src -w /usr/local/share/src andru255/hugocker hugo new site my-site-test
```

##WIP
