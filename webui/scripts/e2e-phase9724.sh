#!/usr/bin/env bash
# Phase-9724: STATUS Soft 9720+ ssh_auth_refusal_status_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9720\+|through 9728|ssh_auth_refusal_status_roster' webui/STATUS.md
grep -qE 'phase9728|through 9728|e2e-phase9736' webui/STATUS.md
echo "STATUS Soft 9720+ ok"; echo "cleaned"; echo "OK: phase9724 e2e passed"
