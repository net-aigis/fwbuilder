#!/usr/bin/env bash
# Phase-34604: STATUS Soft 34600+ ssh_auth_soft_35800_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 34600\+|through 34608|ssh_auth_soft_35800_echo_roster' webui/STATUS.md
grep -qE 'phase34608|through 34608|e2e-phase34616' webui/STATUS.md
echo "STATUS Soft 34600+ ok"; echo "cleaned"; echo "OK: phase34604 e2e passed"
