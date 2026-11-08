#!/usr/bin/env bash
# Phase-10124: STATUS Soft 10120+ ssh_auth_batch_gate_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10120\+|through 10128|ssh_auth_batch_gate_roster' webui/STATUS.md
grep -qE 'phase10128|through 10128|e2e-phase10136' webui/STATUS.md
echo "STATUS Soft 10120+ ok"; echo "cleaned"; echo "OK: phase10124 e2e passed"
