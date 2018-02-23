# Deployment Scripts

This repository contains a few scripts used to ease deployment:
- launch-backend.sh: launches a backend container along with a mongo container to be accessed by the backend
- launch-frontend.sh: launches a frontend container
- deploy: takes three arguments: server to deploy, path to key file, and tag of container to deploy

## Examples
To deploy backend containers:
```bash
sh ./deploy backend /path/to/key-file/
```

To launch frontend containers:
```bash
sh ./deploy frontend /path/to/key-file/
```

To launch a given container with a specific tag:
```bash
./deploy frontend /path/to/key-file/ some-tag
```

If ommitted, tag is assumed to be "latest". If the path to key-file is omitted,
it is assumed to be a file named "kenzie-canvas.pem" in your current location.

If you don't have the deployment repository cloned, you can execute a deployment
using curl:

The above will run frontend containers tagged "some-tag".

## When to Deploy

The deploy script should be run any time updates need to be pushed to the backend
or frontend servers. Any PR that gets merged into master for either repository
will trigger a new build on DockerHub. That is, a new docker `image` will be
built. The EC2 instance needs to then run a container from the updated image,
which is what these scripts accomplish.

# How to deploy.
First, you'll need the "pem" key file from [this](https://github.com/KenzieAcademy/kenzie-canvas) repository. I typically just clone the entire repo and `cd` into the `credentials` directory. 

You'll need to change the permissions of the "pem" file:
```bash
chmod 400 kenzie-canvas.pem
```

Once you ahve done so, you can deploy from your local machine. Once you've
cloned this repository and `cd`ed into the root, you can deploy the frontend
with:
```bash
sh ./deploy frontend /path/to/key-file
```

And the backend with:

```bash
sh ./deploy backend /path/to/key-file
```

This repository ignores pem files, so feel free to copy the kenzie-canvas.pem file into the root of your local version of this repository. Deployment then becomes:

```bash
sh ./deploy frontend
```

Or
```bash
sh ./deploy backend
```
