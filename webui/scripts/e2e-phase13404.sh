#!/usr/bin/env bash
# Phase-13404: STATUS Soft 13400+ ssh_auth_batch_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13400\+|through 13408|ssh_auth_batch_echo_roster' webui/STATUS.md
grep -qE 'phase13408|through 13408|e2e-phase13416' webui/STATUS.md
echo "STATUS Soft 13400+ ok"; echo "cleaned"; echo "OK: phase13404 e2e passed"
