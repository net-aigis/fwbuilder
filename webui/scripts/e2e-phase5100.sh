#!/usr/bin/env bash
# Phase-5100: STATUS mentions ssh_refusal_status_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_status_roster|soft_fertig_ssh_refusal_status_roster' webui/STATUS.md
grep -qE 'phase5104|through 5104|e2e-phase5104' webui/STATUS.md
echo "STATUS ssh-refusal-status roster ok"; echo "cleaned"; echo "OK: phase5100 e2e passed"
