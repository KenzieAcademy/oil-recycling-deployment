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

# How to deploy.
First, you'll need the "pem" secret file from [this](https://github.com/KenzieAcademy/kenzie-canvas) repository. I typically just clone the entire repo and `cd` into the `credentials` directory. Once you have it, you can connect to the frontend server using the following command:
```bash
ssh -i "kenzie-canvas.pem" ec2-user@18.219.80.82  
```

For the backend, that becomes:
```bash
ssh -i "kenzie-canvas.pem" ec2-user@18.219.106.221
```

Once there, run the `curl` command from above, passing arguemnts as appropriate. For the frontend, this will most likely be:
```
curl -s https://raw.githubusercontent.com/KenzieAcademy/oil-recycling-deployment/master/run.sh | bash -s frontend
```

For the backend, only the end of the command needs to change:
```
curl -s https://raw.githubusercontent.com/KenzieAcademy/oil-recycling-deployment/master/run.sh | bash -s backend
```
