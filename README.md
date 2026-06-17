# CI/CD Assignment

This folder contains my CI/CD assignment work inside my main `devops-learning` repository.

## Folder Structure

```text
devops-learning/
└── cicd/
    ├── task-1/
    ├── task-2/
    ├── any-scripts/
    ├── screenshots/
    └── README.md
```

---

## What I Built

I completed two CI/CD tasks:

1. **Task 1:** A basic CI pipeline that runs Python unit tests automatically on push.
2. **Task 2:** A CD workflow that builds and pushes a Docker image to GitHub Container Registry.

---

# Task 1: Basic CI Pipeline

For Task 1, I created a simple Python function and a unit test.

Files used:

```text
cicd/task-1/
├── hello.py
├── test_hello.py
├── requirements.txt
└── README.md
```

The test was first run locally using:

```bash
python3 -m unittest discover
```

After confirming the test passed locally, I created a GitHub Actions workflow to run the test automatically on push.

Workflow file:

```text
../.github/workflows/task-1-ci.yaml
```

The CI pipeline:

1. Runs on push.
2. Checks out the repository.
3. Sets up Python.
4. Moves into `cicd/task-1`.
5. Runs the unit test.

Screenshot:

![Task 1 CI Success](screenshots/task-1-ci-success.png)

---

# Task 2: Docker CD Workflow

For Task 2, I created a small Flask web app and containerised it using Docker.

Files used:

```text
cicd/task-2/
├── app.py
├── Dockerfile
├── requirements.txt
└── README.md
```

The Flask app runs on port `5000` and includes:

* `/` homepage route
* `/health` health check route

I tested the Docker image locally using:

```bash
docker build -t task-2-cd-app .
docker run --rm -p 5000:5000 task-2-cd-app
```

Workflow file:

```text
../.github/workflows/task-2-cd.yaml
```

The CD pipeline:

1. Runs on push to `main`.
2. Checks out the repository.
3. Logs in to GitHub Container Registry.
4. Builds the Docker image from `cicd/task-2`.
5. Pushes the image to GitHub Container Registry.

Published Docker image:

```text
ghcr.io/abdimajidhussein03/task-2-cd-app:latest
```

Pull command:

```bash
docker pull ghcr.io/abdimajidhussein03/task-2-cd-app:latest
```

Screenshots:

![Task 2 CD Success](screenshots/task-2-cd-success.png)

![Task 2 Package Success](screenshots/task-2-package-success.png)

![Task 2 Flask App Local](screenshots/task-2-flask-app-local.png)

![Task 2 Docker Pull](screenshots/task-2-docker-pull.png)

---


# What I Learnt

From this assignment, I learnt:

* How CI and CD differ.
* How GitHub Actions workflows are structured.
* How to run automated tests on push.
* How to build and run Docker images locally.
* How to push Docker images to GitHub Container Registry.
* How `GITHUB_TOKEN` can be used securely in workflows.
* Why Docker tags and build context matter.

---

# Summary

Task 1 demonstrated a basic CI pipeline by automatically running Python unit tests.

Task 2 demonstrated a simple CD workflow by building and publishing a Docker image to GitHub Container Registry.

Together, these tasks show how CI/CD can automate testing, packaging, and publishing in a DevOps workflow.
