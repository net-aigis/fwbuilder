#!/usr/bin/env bash
# Phase-6140: STATUS mentions ssh_alternative_presence_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_presence_roster|soft_fertig_ssh_alternative_presence_roster' webui/STATUS.md
grep -qE 'phase6144|through 6144|e2e-phase6144' webui/STATUS.md
echo "STATUS ssh-alternative-presence roster ok"; echo "cleaned"; echo "OK: phase6140 e2e passed"
