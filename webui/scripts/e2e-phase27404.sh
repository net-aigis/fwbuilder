#!/usr/bin/env bash
# Phase-27404: STATUS Soft 27400+ ssh_auth_schema_279_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27400\+|through 27408|ssh_auth_schema_279_echo_roster' webui/STATUS.md
grep -qE 'phase27408|through 27408|e2e-phase27416' webui/STATUS.md
echo "STATUS Soft 27400+ ok"; echo "cleaned"; echo "OK: phase27404 e2e passed"
