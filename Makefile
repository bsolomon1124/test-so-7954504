
SOURCEDIR := $(shell rpm --eval "%{_sourcedir}")/
RPMDIR := $(shell rpm --eval "%{_rpmdir}")

setup_build:
	yum update -y
	yum install --enablerepo=extras -y epel-release
	yum install -y gcc coreutils python2 python2-devel python2-setuptools tar rpm-build rpm-devel rpmdevtools rpmlint yum-utils
	rpmdev-setuptree

rpm:
	python2 setup.py --quiet egg_info --egg-base /tmp sdist --dist-dir $(SOURCEDIR)
	rpmbuild -bb --noclean project.spec
	mkdir -p dist
	mv -v $(RPMDIR)/noarch/*.rpm dist/
