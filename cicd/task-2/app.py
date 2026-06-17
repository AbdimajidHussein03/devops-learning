from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    return """
    <h1>Task 2 Docker CD App</h1>
    <p>This Flask web app is running inside a Docker container.</p>
    <p>The Docker image was built and pushed using GitHub Actions.</p>
    """


@app.route("/health")
def health():
    return {"status": "ok"}


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)