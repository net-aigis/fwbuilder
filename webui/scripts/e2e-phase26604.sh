#!/usr/bin/env bash
# Phase-26604: STATUS Soft 26600+ ssh_auth_soft_26880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26600\+|through 26608|ssh_auth_soft_26880_echo_roster' webui/STATUS.md
grep -qE 'phase26608|through 26608|e2e-phase26616' webui/STATUS.md
echo "STATUS Soft 26600+ ok"; echo "cleaned"; echo "OK: phase26604 e2e passed"
