#!/usr/bin/env bash
# Phase-6380: STATUS mentions ssh_implemented_agent_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_agent_roster|soft_fertig_ssh_implemented_agent_roster' webui/STATUS.md
grep -qE 'phase6384|through 6384|e2e-phase6384' webui/STATUS.md
echo "STATUS ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6380 e2e passed"
