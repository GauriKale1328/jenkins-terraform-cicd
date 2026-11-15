import os
import socket
from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def home():
    return jsonify({
        "message": "Hello from the Jenkins + Terraform CI/CD demo!",
        "version": os.getenv("APP_VERSION", "local"),
        "served_by": socket.gethostname()
    })

@app.get("/health")
def health():
    return jsonify({"status": "UP"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "5000")))
