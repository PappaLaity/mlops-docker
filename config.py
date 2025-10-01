import os

from dotenv import load_dotenv

load_dotenv()

# API_KEY = os.getenv("API_KEY")
API_KEY = None

try:
    with open("/run/secrets/api_key") as f:
        API_KEY = f.read().strip()
except FileNotFoundError:
    # fallback pour dev/test
    API_KEY = os.getenv("API_KEY", "secret123")

# with open("/run/secrets/api_key") as f:
#     API_KEY = f.read().strip()

LOGISTIC_MODEL = os.getenv("LOGISTIC_MODEL")
RF_MODEL = os.getenv("RF_MODEL")
