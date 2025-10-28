FROM continuumio/miniconda3

# إعداد المستخدم jovyan لتوافق MyBinder
ARG NB_USER=jovyan
ARG NB_UID=1000
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER
USER $NB_USER
WORKDIR /home/$NB_USER

# نسخ جميع الملفات في نفس المجلد
COPY . /home/$NB_USER/

# جعل postBuild قابل للتنفيذ
RUN chmod +x postBuild

# تنفيذ postBuild عند البناء
RUN ./postBuild

# CMD لفتح JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
