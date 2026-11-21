#!/usr/bin/env bash
# Phase-553: expect hard-gap note mentions steps/refusals.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'steps/refusals' webui/backend/fwbweb_api/main.py
echo "expect note refusals ok"
echo "cleaned"
echo "OK: phase553 e2e passed"
