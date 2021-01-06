# so-7954504

MVCE of https://stackoverflow.com/q/65603724/7954504

Run container:

```bash
docker container run -it --rm --volume "$(pwd)":/io --workdir /io --entrypoint bash centos:7
```

Set up and build RPM that will get put in `dist/`:

```bash
$ yum update -y
$ yum install -y make
$ make setup_build
$ make rpm
```

Check requires, see those from `.spec` file are ignored:

```bash
[root@xxxxxx io]# rpm -qp --requires dist/myproj-0.1-1.noarch.rpm
python(abi) = 2.7
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(FileDigests) <= 4.6.0-1
rpmlib(PartialHardlinkSets) <= 4.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
rpmlib(PayloadIsXz) <= 5.2-1
```
