FROM python:latest

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

RUN python3 manage.py migrate

CMD ["gunicorn",  "--bind", "0.0.0.0:8000", "helloworld.wsgi"]