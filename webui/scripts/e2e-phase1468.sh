#!/usr/bin/env bash
# Phase-1468: STATUS mentions session storage keys catalog / 1465-1472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'soft_fertig_session_storage|sessionStorage keys catalog|session storage keys' webui/STATUS.md
grep -qE 'phase1472|through 1472|e2e-phase1472' webui/STATUS.md
echo "STATUS session storage catalog ok"
echo "cleaned"
echo "OK: phase1468 e2e passed"
