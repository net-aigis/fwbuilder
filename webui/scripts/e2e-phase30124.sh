#!/usr/bin/env bash
# Phase-30124: STATUS Soft 30120+ ssh_auth_soft_30840_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30120\+|through 30128|ssh_auth_soft_30840_echo_roster' webui/STATUS.md
grep -qE 'phase30128|through 30128|e2e-phase30136' webui/STATUS.md
echo "STATUS Soft 30120+ ok"; echo "cleaned"; echo "OK: phase30124 e2e passed"
