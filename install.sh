echo ${PYTHON_PATH} -m ensurepip --upgrade

mkdir -p /tmp/pbkt-installation

cd /tmp/pbkt-installation

curl -L -O https://githubraw.com/ubiratann/PBKT/main/main.py  
sed -i 's|#!/bin/python3.10|#!'${PYTHON_PATH}'|' main.py

curl -L -O /tmp https://githubraw.com/ubiratann/PBKT/main/requirements.txt  
echo ${PYTHON_PATH} -m pip install -r requirements.txt

echo mv main.py tmp/usr/bin/pbkt
echo chmod a=rx tmp/usr/bin/pbkt
