# CI/CD Assignment

This folder contains my CI/CD assignment work inside my main `devops-learning` repository.

---

## Repository Structure

```text
devops-learning/
├── .github/
│   └── workflows/
│       ├── ci.yaml
│       └── cd.yaml
└── cicd/
    ├── any-scripts/
    │   ├── test.sh
    │   └── docker-local.sh
    ├── screenshots/
    ├── task-1/
    ├── task-2/
    └── README.md
```

---

## What I Built

I completed two CI/CD tasks:

1. **Task 1:** A basic CI pipeline that runs Python unit tests automatically on push.
2. **Task 2:** A CD workflow that builds and pushes a Docker image to GitHub Container Registry.

I also added helper scripts inside `any-scripts/` to make local testing easier.

---

# Task 1: Basic CI Pipeline

## Overview

For Task 1, I created a small Python project with a simple function and a unit test.

The purpose of this task was to demonstrate a basic CI workflow where tests run automatically whenever code is pushed to GitHub.

## Files

```text
cicd/task-1/
├── hello.py
├── test_hello.py
├── requirements.txt
└── README.md
```

## How It Works

The `hello.py` file contains the Python code being tested.

The `test_hello.py` file uses Python's built-in `unittest` framework to check that the function returns the expected output.

I first tested it locally using:

```bash
python3 -m unittest discover
```

After confirming the test passed locally, I created a GitHub Actions workflow to automate the same test on push.

## Workflow File

```text
.github/workflows/ci.yaml
```

Relative link:

[Task 1 CI Workflow](../.github/workflows/ci.yaml)

## Pipeline Steps

The Task 1 CI pipeline:

1. Runs on push.
2. Checks out the repository.
3. Sets up Python.
4. Changes into `cicd/task-1`.
5. Runs the unit tests.

## Screenshot

![Task 1 CI Success](screenshots/task-1-ci-success.png)

---

# Task 2: Docker CD Workflow

## Overview

For Task 2, I created a small Flask web application and containerised it using Docker.

The purpose of this task was to demonstrate a simple CD workflow where a Docker image is built and pushed automatically to GitHub Container Registry.

## Files

```text
cicd/task-2/
├── app.py
├── Dockerfile
├── requirements.txt
└── README.md
```

## Flask App

The Flask app includes:

* `/` homepage route
* `/health` health check route

The app runs on port `5000`.

When run locally, it can be viewed at:

```text
http://127.0.0.1:5000
```

## Docker

I tested the Docker image locally using:

```bash
docker build -t task-2-cd-app .
docker run --rm -p 5000:5000 task-2-cd-app
```

This confirmed that the Flask app worked correctly inside a Docker container before pushing it through the CD pipeline.

## Workflow File

```text
.github/workflows/cd.yaml
```

Relative link:

[Task 2 CD Workflow](../.github/workflows/cd.yaml)

## CD Pipeline Steps

The Task 2 CD pipeline:

1. Runs on push to the `main` branch.
2. Checks out the repository.
3. Logs in to GitHub Container Registry.
4. Builds the Docker image from `cicd/task-2`.
5. Pushes the image to GitHub Container Registry.

## Published Docker Image

The Docker image was published to GitHub Container Registry as:

```text
ghcr.io/abdimajidhussein03/task-2-cd-app:latest
```

Pull command:

```bash
docker pull ghcr.io/abdimajidhussein03/task-2-cd-app:latest
```

---

# Helper Scripts

I added two helper scripts inside:

```text
cicd/any-scripts/
```

## Task 1 Helper Script

```text
cicd/any-scripts/test.sh
```

This script runs the Task 1 Python unit tests locally.

Run it from the repository root with:

```bash
bash cicd/any-scripts/test.sh
```

## Task 2 Helper Script

```text
cicd/any-scripts/docker-local.sh
```

This script builds and runs the Task 2 Flask Docker app locally.

Run it from the repository root with:

```bash
bash cicd/any-scripts/docker-local.sh
```

Then open:

```text
http://127.0.0.1:5000
```

---

# Screenshots

## Task 1 CI Pipeline Passing

![Task 1 CI Success](screenshots/task-1-ci-success.png)

## Task 2 CD Pipeline Passing

![Task 2 CD Success](screenshots/task-2-cd-success.png)

## Docker Image Published to GitHub Container Registry

![Task 2 Package Success](screenshots/task-2-package-success.png)

## Docker Image Pulled from GHCR

![Task 2 Docker Pull](screenshots/task-2-docker-pull.png)

## Flask App Running Locally

![Task 2 Flask App Local](screenshots/task-2-flask-app-local.png)

---


# What I Learnt

Through this assignment, I learnt:

* How CI and CD differ.
* How GitHub Actions workflows are structured.
* How to trigger workflows on push.

---

# Summary

Task 1 demonstrated a basic CI pipeline by automatically running Python unit tests on push.

Task 2 demonstrated a simple CD workflow by building and publishing a Docker image to GitHub Container Registry.

Together, these tasks show how CI/CD can automate testing, packaging, and publishing as part of a DevOps workflow.

