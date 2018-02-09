# Deployment Scripts

This repository contains a few scripts used to ease deployment:
- clean-docker.sh: removes all instances and containers from a machine
- launch-backend.sh: launches a backend container along with a mongo container to be accessed by the backend
- launch-frontend.sh: launches a frontend container
- run.sh: takes launches a given script with a specific tag

## Examples
To launch backend containers:
```bash
./run backend
```

To launch frontend containers:
```bash
./run frontend
```

To launch a given container with a specific tag:
```bash
./run frontend some-tag
```

If ommitted, tag is assumed to be "latest".

It's often useful to ssh into the instance and curl the run script. For example:
```bash
curl -s https://raw.githubusercontent.com/KenzieAcademy/oil-recycling-deployment/master/run.sh | bash -s frontend some-tag
```

The above will run frontend containers tagged "some-tag".

## When to Deploy

The run script should be run any time updates need to be pushed to the backend
or frontend servers. Any PR that gets merged into master for either repository
will trigger a new build on DockerHub. That is, a new docker `image` will be
built. The EC2 instance needs to then run a container from the updated image,
which is what these scripts accomplish.
