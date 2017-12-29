# repo

This repository is used to generate `2ll2/repo-*` docker images containing
`.apk` package repository.

In order to generate the docker image, you'll require the following information.

1. Aports repo name (`<REPO_NAME>`)

2. Aports tree version (`<VERSION>`)

3. Apk package architectures (For example - aarch64, x86_64) (`<ARCH1> | <ARCH1>.<ARCH2>`)

4. Git commit short SHA (`<SHORT_SHA>`)

If `HEAD` is the commit that we are generating the repository for, then we can
get the short SHA using the following command.

```
$ cd aports-<REPO_NAME>

(inside the aports directory)

aports-<REPO_NAME> $ git rev-parse --short HEAD
```

Once we have the above information, verify that we have required `.apk`
packages.

```
$ cd repo

repo $ tree <REPO_NAME>/<VERSION>
```

To build the docker image

```
$ cd repo

repo $ docker build \
        --build-arg overlay=<REPO_NAME> \
        --build-arg version=<VERSION> \
        -t 2ll2/repo-<REPO_NAME>:<VERSION>-<SHORT_SHA>-<ARCH1>.<ARCH2> .

(For example)

repo $ docker build \
        --build-arg overlay=virtualbox \
        --build-arg version=v3.7 \
        -t 2ll2/repo-virtualbox:v3.7-abcdef1-x86_64 .

repo $ docker push 2ll2/repo-virtualbox:v3.7-abcdef1-x86_64
```
