#  base image for our Docker image
FROM python:3

# prevent Python from writing bytecode files(reduce disk usage improve startup time)
ENV PYTHONDONTWRITEBYTECODE=1

# disable output buffering(immediate output display)
ENV PYTHONUNBUFFERED=1

# sets the working directory inside the container t
WORKDIR /code

# opies the requirements.txt file from the host machine
COPY requirements.txt .

# installs the Python dependencies  listed in the requirements.txt file inside the container
RUN pip install -r requirements.txt

# copies all the files and directories from the current directory to the current working directory in the container 
COPY . .

# informs Docker that the application inside the container will be listening on port 8000
EXPOSE 8000

# sets the default command to be executed when the container is run
CMD ["python3","manage.py","runserver"]