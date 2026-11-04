#!/usr/bin/env bash
# Phase-1548: STATUS mentions session storage notes / 1545-1552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session.?storage.?notes|session_storage_notes' webui/STATUS.md
grep -qE 'phase1552|through 1552|e2e-phase1552' webui/STATUS.md
echo "STATUS session storage notes ok"
echo "cleaned"
echo "OK: phase1548 e2e passed"
