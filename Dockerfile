FROM jupyter/scipy-notebook


RUN set -ex \
   && conda install --quiet --yes \
   # choose the python packages you need
   'plotly==4.14.3' \
   'xgboost==1.4.0' \
   && conda clean --all -f -y \
   # install jupyter lab extensions you need
   && jupyter labextension install jupyterlab-plotly --no-build \
   && jupyter lab build -y \
   && jupyter lab clean -y \
   && rm -rf "/home/${NB_USER}/.cache/yarn" \
   && rm -rf "/home/${NB_USER}/.node-gyp" \
   && fix-permissions "${CONDA_DIR}" \
   && fix-permissions "/home/${NB_USER}"
