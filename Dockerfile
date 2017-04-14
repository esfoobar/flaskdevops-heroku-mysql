FROM python:3.4.5-slim

## make a local directory
RUN mkdir /counter_app

# set "counter_app" as the working directory from which CMD, RUN, ADD references
WORKDIR /counter_app

# now copy all the files in this directory to /counter_app
ADD . .

# pip install the local requirements.txt
RUN pip install -r requirements.txt

RUN ls -al

# Define our command to be run when launching the container
CMD gunicorn wsgi:app --bind 0.0.0.0:$PORT --reload
