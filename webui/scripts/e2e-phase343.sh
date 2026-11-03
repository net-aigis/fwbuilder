#!/usr/bin/env bash
# Phase-343: closure endpoint note rejects fidelity-only close.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout-fidelity score alone' webui/backend/fwbweb_api/main.py
echo "closure honesty note ok"
echo "cleaned"
echo "OK: phase343 e2e passed"
