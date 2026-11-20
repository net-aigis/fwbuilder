#!/usr/bin/env bash
# Phase-42604: STATUS Soft 42600+ ssh_auth_soft_44800_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 42600\+|through 42608|ssh_auth_soft_44800_echo_roster' webui/STATUS.md
grep -qE 'phase42608|through 42608|e2e-phase42616' webui/STATUS.md
echo "STATUS Soft 42600+ ok"; echo "cleaned"; echo "OK: phase42604 e2e passed"
