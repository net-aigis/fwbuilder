#!/usr/bin/env bash
# Phase-1484: STATUS mentions session storage on summary/closure / 1481-1488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'session storage keys.*(summary|closure)|summary.*session storage' webui/STATUS.md
grep -qE 'phase1488|through 1488|e2e-phase1488' webui/STATUS.md
echo "STATUS session storage summary/closure ok"
echo "cleaned"
echo "OK: phase1484 e2e passed"
