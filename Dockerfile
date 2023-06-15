#Base image
FROM ubuntu:latest

#set the working directoru
WORKDIR /app

#update the package repo and install necessary dependenices
RUN apt-get update && apt-get install -y python3 python3-pip

#copy requiremnnt.txt
COPY requirement.txt .

#Install the dependency
RUN pip3 install --no-cache-dir -r requirement.txt

#copy the application files
COPY app.py .
COPY templates/ ./templates
COPY static ./static

#expose the application port
EXPOSE 5000

#SET env variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

#run the application 
CMD ["flask", "run"]