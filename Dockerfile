FROM frolvlad/alpine-miniconda3

#Installs Git LFS
RUN apk --no-cache add openssl git curl && \
curl -kLO https://github.com/github/git-lfs/releases/download/v2.0.1/git-lfs-linux-amd64-2.0.1.tar.gz && \
tar zxvf git-lfs-linux-amd64-2.0.1.tar.gz && \
mv git-lfs-2.0.1/git-lfs /usr/bin/ && \
rm -rf git-lfs-2.0.1 && \
rm -rf git-lfs-linux-amd64-2.0.1.tar.gz

# Install Conda Packages
RUN conda config --set ssl_verify no && \
conda install conda=4.4.10 && \
conda install numpy=1.14.0 pandas=0.22.0 datashape=0.5.4 setuptools=38.4.0 pytest=3.3.2 \
sphinx=1.6.6 coverage=4.4.2 flake8=3.5.0

#Installs flake8 and coverage
# RUN pip install coverage flake8