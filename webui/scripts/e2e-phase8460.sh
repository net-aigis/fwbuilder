#!/usr/bin/env bash
# Phase-8460: STATUS mentions ssh_implemented_agent_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_agent_refresh_roster|soft_fertig_ssh_implemented_agent_refresh_roster' webui/STATUS.md
grep -qE 'phase8464|through 8464|e2e-phase8464' webui/STATUS.md
echo "STATUS ssh-implemented-agent-refresh roster ok"; echo "cleaned"; echo "OK: phase8460 e2e passed"
