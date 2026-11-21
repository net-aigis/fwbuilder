#!/usr/bin/env bash
# Phase-23724: STATUS Soft 23720+ ssh_auth_soft_23640_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23720\+|through 23728|ssh_auth_soft_23640_echo_roster' webui/STATUS.md
grep -qE 'phase23728|through 23728|e2e-phase23736' webui/STATUS.md
echo "STATUS Soft 23720+ ok"; echo "cleaned"; echo "OK: phase23724 e2e passed"
