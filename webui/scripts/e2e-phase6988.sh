#!/usr/bin/env bash
# Phase-6988: STATUS mentions ssh_auth_policy_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_policy_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_auth_policy_refresh_roster' webui/STATUS.md
grep -qE 'phase6992|through 6992|e2e-phase6992' webui/STATUS.md
echo "STATUS ssh_auth_policy_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6988 e2e passed"
