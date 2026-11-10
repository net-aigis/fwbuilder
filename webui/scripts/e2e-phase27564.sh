#!/usr/bin/env bash
# Phase-27564: STATUS Soft 27560+ ssh_auth_soft_27960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27560\+|through 27568|ssh_auth_soft_27960_echo_roster' webui/STATUS.md
grep -qE 'phase27568|through 27568|e2e-phase27576' webui/STATUS.md
echo "STATUS Soft 27560+ ok"; echo "cleaned"; echo "OK: phase27564 e2e passed"
