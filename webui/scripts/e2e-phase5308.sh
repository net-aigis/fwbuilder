#!/usr/bin/env bash
# Phase-5308: STATUS mentions ssh_auth_policy_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_policy_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_auth_policy_roster' webui/STATUS.md
grep -qE 'phase5312|through 5152|e2e-phase5312' webui/STATUS.md
echo "STATUS ssh_auth_policy_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5308 e2e passed"
