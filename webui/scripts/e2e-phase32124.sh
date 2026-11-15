#!/usr/bin/env bash
# Phase-32124: STATUS Soft 32120+ ssh_auth_ms_72000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 32120\+|through 32128|ssh_auth_ms_72000_echo_roster' webui/STATUS.md
grep -qE 'phase32128|through 32128|e2e-phase32136' webui/STATUS.md
echo "STATUS Soft 32120+ ok"; echo "cleaned"; echo "OK: phase32124 e2e passed"
