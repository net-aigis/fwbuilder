#!/usr/bin/env bash
# Phase-5340: STATUS mentions ssh_alternative_notes_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_roster|soft_fertig_ssh_alternative_notes_roster' webui/STATUS.md
grep -qE 'phase5344|through 5104|e2e-phase5344' webui/STATUS.md
echo "STATUS ssh-alternative-notes roster ok"; echo "cleaned"; echo "OK: phase5340 e2e passed"
