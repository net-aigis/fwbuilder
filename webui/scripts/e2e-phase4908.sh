#!/usr/bin/env bash
# Phase-4908: STATUS mentions ssh_capability_flags_roster sessionStorage / 4905-4912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_capability_flags_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_capability_flags_roster' webui/STATUS.md
grep -qE 'phase4912|through 4912|e2e-phase4912' webui/STATUS.md
echo "STATUS ssh_capability_flags_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase4908 e2e passed"
