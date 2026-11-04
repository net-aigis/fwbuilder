#!/usr/bin/env bash
# Phase-2460: STATUS mentions sessionStorage roster / 2457-2464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session_storage_roster|sessionStorage roster' webui/STATUS.md
grep -qE 'phase2464|through 2464|e2e-phase2464' webui/STATUS.md
echo "STATUS sessionStorage roster ok"
echo "cleaned"
echo "OK: phase2460 e2e passed"
