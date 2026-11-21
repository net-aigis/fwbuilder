#!/usr/bin/env bash
# Lab proof: password + expect against an ephemeral Paramiko SSH server (TCP).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT/webui/backend"
# shellcheck disable=SC1091
source .venv/bin/activate
pytest -q tests/test_lab_ssh.py
echo "OK: lab SSH e2e (password + expect over TCP)"
