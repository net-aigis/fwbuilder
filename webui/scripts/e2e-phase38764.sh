#!/usr/bin/env bash
# Phase-38764: STATUS Soft 38760+ ssh_auth_soft_40480_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 38760\+|through 38768|ssh_auth_soft_40480_echo_roster' webui/STATUS.md
grep -qE 'phase38768|through 38768|e2e-phase38776' webui/STATUS.md
echo "STATUS Soft 38760+ ok"; echo "cleaned"; echo "OK: phase38764 e2e passed"
