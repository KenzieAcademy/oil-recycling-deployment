# Deployment Scripts
This repository contains a few scripts used to ease deployment:
- launch-backend.sh: launches a backend container along with a mongo container to be accessed by the backend
- launch-frontend.sh: launches a frontend container
- deploy: takes three arguments: server to deploy, path to key file, and tag of container to deploy

# TL;DR
Assuming you have the proper SSH keys added to your SSH agent (hint: if this
sentence doesn't make sense, skip down to "How to Deploy") you can deploy the
backend with:

```bash
./deploy backend <tag>
```

And the frontend with:
```bash
sh ./deploy frontend <tag>
```

If ommitted, tag is assumed to be "latest".

## When to Deploy
These scripts should only be needed in cases where CircleCI failed to properly
deploy, or cases when we want to manually deploy an old tag.

# How to deploy.
First, you'll need the "pem" key file from
[here]("https://raw.githubusercontent.com/KenzieAcademy/kenzie-canvas/master/credentials/kenzie-canvas.pem?token=AAFt9v-ioq73PU21YD1maAuFD7ocCdIkks5azJCnwA%3D%3D")

You'll need to add that "pem" file (private key) to your ssh agent:
```bash
eval `ssh-agent -s`
ssh-add kenzie-canvas.pem
```

Once you have done so, you can deploy from your local machine using the instructions above in "TL;DR".
