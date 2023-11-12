#!/bin/sh 

${PYTHON_PATH} -m ensurepip --upgrade

mkdir -p /tmp/pbkt-installation

cd /tmp/pbkt-installation

curl -L -O https://githubraw.com/ubiratann/PBKT/main/main.py

if [ -n "$(uname -a | grep -i freebsd)" ]; 
then 
  sed -i '' 's|#!/bin/python3.10|#!'${PYTHON_PATH}'|' main.py
else
  sed -i 's|#!/bin/python3.10|#!'${PYTHON_PATH}'|' main.py
fi;

curl -L -O https://githubraw.com/ubiratann/PBKT/main/requirements.txt  
${PYTHON_PATH} -m pip install -r requirements.txt

mv main.py tmp/usr/bin/pbkt
chmod a=rx tmp/usr/bin/pbkt
