#!/usr/bin/env bash
# Phase-5948: STATUS mentions ssh_batch_mode_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_batch_mode_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_batch_mode_roster' webui/STATUS.md
grep -qE 'phase5952|through 6352|e2e-phase5952' webui/STATUS.md
echo "STATUS ssh_batch_mode_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5948 e2e passed"
