# GoHugo with docker

Docker image with hugo inside

## Inspired of amazing images/repos/tutorials:

- [VictorJSV/docker-gulp](https://github.com/VictorJSV/docker-gulp)

- [jojomi/docker-hugo](https://github.com/jojomi/docker-hugo)

- [So Recursive It Hurts - Ahmed Alani](http://ahmedalani.com/post/so-recursive-it-hurts/)

## Prerequisites

- [Docker](https://www.docker.com/) 17.05 or higher

- [docker-compose](https://docs.docker.com/compose/) 1.6.2 or higher

## Contains

- [Alpine image](https://hub.docker.com/_/alpine/) v.3.6

- [hugo](http://gohugo.io/) 0.53

## How to use

### Creating a new hugo structure
If I want to create a new hugo structure in my current path:

```
~ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/:/usr/local/share/src -w /usr/local/share/src andru255/hugocker hugo new site my-site-test
```

### Create a demo post
I need to locate my new site like a volume, but don't change the src folder from the container

```
~ cd my-site-test
~ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/:/usr/local/share/src -w /usr/local/share/src andru255/hugocker hugo new post/my-post-demo.md
```

### Setup a theme for test
If do you want to install a new theme, it's no depends for hugocker, but a little example:
If I want to install [the hyde theme](https://github.com/spf13/hyde)

```
~ cd my-site-test/themes
~ git clone https://github.com/spf13/hyde
```

### Getting live-dev my hugo site on local
We have what it takes to have a visible blog (structure, a post, a theme), and we want to getting visible on a browser:

```
~ cd my-site-test
~ docker run --publish 1313:1313 --rm --user $(id -u):$(id -g) -v $(pwd)/:/usr/local/share/src -w /usr/local/share/src andru255/hugocker hugo server -D -t hyde --bind=0.0.0.0
```

### Build my static blog

That command creates a folder with name **public** which contains the static files to publish

```
~ cd my-site-test
~ docker run --publish 1313:1313 --rm --user $(id -u):$(id -g) -v $(pwd)/:/usr/local/share/src -w /usr/local/share/src andru255/hugocker hugo -D -v -t hyde
```

## With docker-compose

### Defining the config file

The *docker-compose.yml** file:

```
version: "2"
services:
  hugocker:
    image: andru255/hugocker
    ports:
      - "1313:1313"
    working_dir: "/usr/local/share/src"
    volumes:
      - $PWD:/usr/local/share/src
```

### Creating a new hugo structure

If I want to create a new hugo structure in my current path:

```
~ docker-compose run --rm --user $(id -u):$(id -g) hugocker hugo new site my-site-test
```

### Create a demo post
I need to locate my new site like a volume, but don't change the src folder from the container

```
~ cd my-site-test
~ docker-compose run --rm --user $(id -u):$(id -g) hugocker hugo new post/my-post-demo.md
```
### Setup a theme for test

The same process because only needs git:

```
~ cd my-site-test/themes
~ git clone https://github.com/spf13/hyde
```

### Getting live-dev my hugo site on local
We have what it takes to have a visible blog (structure, a post, a theme), and we want to getting visible on a browser:

```
~ cd my-site-test
~ docker-compose run --publish 1313:1313 --rm --user $(id -u):$(id -g) hugocker hugo server -D -t hyde --bind=0.0.0.0
```

### Build my static blog

```
~ cd my-site-test
~ docker-compose run --rm --user $(id -u):$(id -g) hugocker hugo -D -v -t hyde
```
