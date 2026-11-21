#!/usr/bin/env bash
# Phase-2476: STATUS mentions session_storage_roster export / 2473-2480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session_storage_roster.*(export|bundle)|export.*session_storage_roster|bundle.*session_storage_roster' webui/STATUS.md
grep -qE 'phase2480|through 2480|e2e-phase2480' webui/STATUS.md
echo "STATUS session_storage_roster export ok"
echo "cleaned"
echo "OK: phase2476 e2e passed"
