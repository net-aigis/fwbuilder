#!/usr/bin/env bash
# Phase-176: phase165 still passes after qtGrid helper extraction.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
bash webui/scripts/e2e-phase165.sh
echo "OK: phase176 e2e passed"
