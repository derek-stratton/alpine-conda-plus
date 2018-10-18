FROM frolvlad/alpine-miniconda3

#Installs Git LFS
RUN apk --no-cache add openssl git curl && \
curl -kLO https://github.com/github/git-lfs/releases/download/v2.0.1/git-lfs-linux-amd64-2.0.1.tar.gz && \
tar zxvf git-lfs-linux-amd64-2.0.1.tar.gz && \
mv git-lfs-2.0.1/git-lfs /usr/bin/ && \
rm -rf git-lfs-2.0.1 && \
rm -rf git-lfs-linux-amd64-2.0.1.tar.gz

RUN conda config --set ssl_verify no && \
conda update conda && \
conda install numpy pandas datashape setuptools pytest sphinx

#Installs flake8 and coverage
RUN pip install coverage flake8