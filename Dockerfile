FROM python:3.11-slim

WORKDIR /app

COPY src/api/ .

#COPY requirements.txt .
#COPY wheelhouse/ /wheelhouse/
#RUN pip install --no-index --find-links=/wheelhouse -r requirements.txt
RUN pip install --default-timeout=800 -r requirements.txt

COPY models/trained/*.pkl models/trained/

EXPOSE 8888

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8888"]