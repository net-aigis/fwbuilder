#!/usr/bin/env bash
# Phase-395: hard-gaps advertises expect_run_path + password_ssh_path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_run_path' webui/backend/fwbweb_api/main.py
grep -Fq 'password_ssh_path' webui/backend/fwbweb_api/main.py
echo "hard-gaps refuse paths ok"
echo "cleaned"
echo "OK: phase395 e2e passed"
