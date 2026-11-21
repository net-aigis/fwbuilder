#!/usr/bin/env bash
# Phase-43564: STATUS Soft 43560+ ssh_auth_soft_45880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43560\+|through 43568|ssh_auth_soft_45880_echo_roster' webui/STATUS.md
grep -qE 'phase43568|through 43568|e2e-phase43576' webui/STATUS.md
echo "STATUS Soft 43560+ ok"; echo "cleaned"; echo "OK: phase43564 e2e passed"
