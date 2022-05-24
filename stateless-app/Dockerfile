FROM python:3.6
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt
EXPOSE 8080
ENV NAME world
CMD ["python", "stateless-app-flask.py"]