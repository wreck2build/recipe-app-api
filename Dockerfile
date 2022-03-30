FROM python:3.11.0a6-alpine
MAINTAINER matin
#used for knowing who is maintaining the project, just put a name

ENV PYTHONUNBUFFERED 1
#tells python to run in unbufferd mode (is recommended when using python in docker), it doesnt allow python to buffer the output

COPY ./requirements.txt /requirements.txt
#it says from the directory adjacent to the dockerfile copy the requirements file thats been created and copy it on the Docker image to /requirements.txt
RUN pip install -r /requirements.txt
#takes the requirements file that we just copied and installs it using pip into Docker image

RUN mkdir /app
WORKDIR /app
COPY ./app /app
#makes an empty directory in our docker image and switches to that as the default directory, so any application we run using docker will run from /app location
#than it copies app from the local machine to the /app in docker image

RUN adduser -D user
USER user
#we used the name 'user' as our username,
#we created a user for running application only, its for security of our project, incase if somebody comprimises our application