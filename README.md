# docker-regular-py
A simple image to run a Python3 script at regular intervals

Brief description:
* The image uses Alpine:3.15 and Python:3.10.2
* Volume /usr/src/app as WORKDIR
* Environment Variables:
  * ``SCRIPT2RUN``: name of the Python script to run in the WORKDIR
  * ``DELAY_SEC``: delay between execution in seconds
  * ``VERBOSE``: if set to 1, the image generates more logs during start

## Usage

```
docker run -d \
  --name py_script \
  -e VERBOSE=1 \
  -e DELAY_SEC=300 \
  -e SCRIPT2RUN=your_script  \
  -v /your_script_dir:/usr/src/app \
  etaylashev/regular_py
```
