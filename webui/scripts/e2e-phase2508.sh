#!/usr/bin/env bash
# Phase-2508: STATUS mentions session_storage_roster sessionStorage / 2505-2512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session_storage_roster.*(sessionStorage|Clear)|sessionStorage.*session_storage_roster' webui/STATUS.md
grep -qE 'phase2512|through 2512|e2e-phase2512' webui/STATUS.md
echo "STATUS session_storage_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2508 e2e passed"
