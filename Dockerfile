FROM python:2.7
MAINTAINER Fred Teo <fredteo@data.gov.sg>


# install python modules
RUN pip install jupyter psutil gitpython requests


# create ipython profile
RUN ipython profile create nbserver


# add git filter to strip notebook output
RUN wget -O /usr/local/bin/ipynb_stripout "https://raw.githubusercontent.com/jond3k/ipynb_stripout/master/ipynb_stripout" && \
    chmod +x /usr/local/bin/ipynb_stripout && \
    git config --global filter.ipynb_stripout.clean ipynb_stripout && \
    git config --global filter.ipynb_stripout.smudge cat && \
    git config --global filter.ipynb_stripout.required true


# install notebook extensions
RUN cd /tmp && \
    git clone https://github.com/ipython-contrib/IPython-notebook-extensions.git && \
    cd IPython-notebook-extensions && \
    mkdir --parents /root/.local/share/jupyter && \
    python setup.py install
ADD config/jupyter/extensions/notebook.json /root/.jupyter/nbconfig/
ADD config/jupyter/extensions/github-commit-push.js /root/.ipython/nbextensions/
ADD config/jupyter/extensions/github_commit_push.py /root/.local/share/jupyter/extensions/


# configure git access
ADD config/ssh /root/.ssh


# customize Jupyter's logo
ADD config/jupyter/logo.png /usr/local/lib/python2.7/dist-packages/notebook/static/base/images/logo.png

# install and enable github-commit-push extension
WORKDIR /data
ENV PYTHONPATH /root/.local/share/jupyter/extensions/
RUN jupyter nbextension install /root/.ipython/nbextensions/github-commit-push.js
RUN jupyter nbextension enable github-commit-push


# default to jupyter notebook
ADD config/jupyter/run/notebook.sh /notebook.sh
CMD ["/notebook.sh"]
