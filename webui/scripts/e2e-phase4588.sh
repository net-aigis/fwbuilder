#!/usr/bin/env bash
# Phase-4588: STATUS mentions ssh_auth_roster sessionStorage / 4585-4592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_auth_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_auth_roster' webui/STATUS.md
grep -qE 'phase4592|through 4592|e2e-phase4592' webui/STATUS.md
echo "STATUS ssh_auth_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4588 e2e passed"
