FROM python:3.12-slim


# Create a non-root user
RUN useradd -m appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .


# Give ownership of the app directory to the non-root user
# RUN chown -R appuser:appuser /app

# Pass to the non-root user
USER appuser

# # Env Variables
# ENV RF_MODEL="models/random_forest.pkl"

# RUN mkdir models


EXPOSE 8000

# CMD ["python", "main.py"]
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

