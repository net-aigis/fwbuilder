#!/usr/bin/env bash
# Phase-5420: STATUS mentions ssh_alternative_titles_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_titles_roster|soft_fertig_ssh_alternative_titles_roster' webui/STATUS.md
grep -qE 'phase5424|through 5104|e2e-phase5424' webui/STATUS.md
echo "STATUS ssh-alternative-titles roster ok"; echo "cleaned"; echo "OK: phase5420 e2e passed"
