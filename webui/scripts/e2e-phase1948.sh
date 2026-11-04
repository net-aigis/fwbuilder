#!/usr/bin/env bash
# Phase-1948: STATUS mentions readiness sessionStorage / 1945-1952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'readiness.*sessionStorage|sessionStorage.*readiness|honestyReadiness' webui/STATUS.md
grep -qE 'phase1952|through 1952|e2e-phase1952' webui/STATUS.md
echo "STATUS readiness sessionStorage ok"
echo "cleaned"
echo "OK: phase1948 e2e passed"
