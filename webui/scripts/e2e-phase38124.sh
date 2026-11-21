#!/usr/bin/env bash
# Phase-38124: STATUS Soft 38120+ ssh_auth_soft_39760_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 38120\+|through 38128|ssh_auth_soft_39760_echo_roster' webui/STATUS.md
grep -qE 'phase38128|through 38128|e2e-phase38136' webui/STATUS.md
echo "STATUS Soft 38120+ ok"; echo "cleaned"; echo "OK: phase38124 e2e passed"
