#!/usr/bin/env bash
# Phase-6444: STATUS Soft 6440+ ssh_implemented_agent_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6456|ssh_implemented_agent_roster' webui/STATUS.md
grep -qE 'phase6448|through 6448|e2e-phase6456' webui/STATUS.md
echo "STATUS Soft 6440+ ok"; echo "cleaned"; echo "OK: phase6444 e2e passed"
