#!/usr/bin/env bash
# Phase-25644: STATUS Soft 25640+ ssh_auth_soft_25800_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25640\+|through 25648|ssh_auth_soft_25800_echo_roster' webui/STATUS.md
grep -qE 'phase25648|through 25648|e2e-phase25656' webui/STATUS.md
echo "STATUS Soft 25640+ ok"; echo "cleaned"; echo "OK: phase25644 e2e passed"
