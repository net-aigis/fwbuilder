#!/usr/bin/env bash
# Phase-2988: STATUS mentions ssh_honesty_roster sessionStorage / 2985-2992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_honesty_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_honesty_roster' webui/STATUS.md
grep -qE 'phase2992|through 2992|e2e-phase2992' webui/STATUS.md
echo "STATUS ssh_honesty_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2988 e2e passed"
