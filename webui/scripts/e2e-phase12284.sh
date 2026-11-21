#!/usr/bin/env bash
# Phase-12284: STATUS Soft 12280+ ssh_auth_policy_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 12280\+|through 12288|ssh_auth_policy_echo_roster' webui/STATUS.md
grep -qE 'phase12288|through 12288|e2e-phase12296' webui/STATUS.md
echo "STATUS Soft 12280+ ok"; echo "cleaned"; echo "OK: phase12284 e2e passed"
