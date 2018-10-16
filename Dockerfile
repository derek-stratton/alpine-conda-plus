FROM frolvlad/alpine-miniconda3

#Installs Git LFS
RUN apk --no-cache add openssl git curl 
RUN curl -kLO https://github.com/github/git-lfs/releases/download/v2.0.1/git-lfs-linux-amd64-2.0.1.tar.gz 
RUN tar zxvf git-lfs-linux-amd64-2.0.1.tar.gz 
RUN mv git-lfs-2.0.1/git-lfs /usr/bin/ 
RUN rm -rf git-lfs-2.0.1 
RUN rm -rf git-lfs-linux-amd64-2.0.1.tar.gz

RUN conda config --set ssl_verify no
RUN conda install numpy pandas datashape setuptools pytest sphinx
# unittest codecs tempfile doctest
#Installs flake8 and coverage
RUN pip install coverage flake8