#!/usr/bin/env bash
# Phase-6428: STATUS mentions ssh_implemented_agent_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_agent_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_implemented_agent_roster' webui/STATUS.md
grep -qE 'phase6432|through 6432|e2e-phase6432' webui/STATUS.md
echo "STATUS ssh_implemented_agent_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6428 e2e passed"
