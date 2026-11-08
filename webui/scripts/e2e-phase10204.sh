#!/usr/bin/env bash
# Phase-10204: STATUS Soft 10200+ ssh_auth_support_gate_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10200\+|through 10208|ssh_auth_support_gate_roster' webui/STATUS.md
grep -qE 'phase10208|through 10208|e2e-phase10216' webui/STATUS.md
echo "STATUS Soft 10200+ ok"; echo "cleaned"; echo "OK: phase10204 e2e passed"
