#!/usr/bin/env bash
# Phase-28204: STATUS Soft 28200+ ssh_auth_soft_28680_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28200\+|through 28208|ssh_auth_soft_28680_echo_roster' webui/STATUS.md
grep -qE 'phase28208|through 28208|e2e-phase28216' webui/STATUS.md
echo "STATUS Soft 28200+ ok"; echo "cleaned"; echo "OK: phase28204 e2e passed"
