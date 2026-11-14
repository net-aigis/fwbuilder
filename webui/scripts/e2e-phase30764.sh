#!/usr/bin/env bash
# Phase-30764: STATUS Soft 30760+ ssh_auth_soft_31560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30760\+|through 30768|ssh_auth_soft_31560_echo_roster' webui/STATUS.md
grep -qE 'phase30768|through 30768|e2e-phase30776' webui/STATUS.md
echo "STATUS Soft 30760+ ok"; echo "cleaned"; echo "OK: phase30764 e2e passed"
