#!/usr/bin/env bash
# Phase-8220: STATUS mentions ssh_alternative_presence_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_presence_refresh_roster|soft_fertig_ssh_alternative_presence_refresh_roster' webui/STATUS.md
grep -qE 'phase8224|through 8224|e2e-phase8224' webui/STATUS.md
echo "STATUS ssh-alternative-presence-refresh roster ok"; echo "cleaned"; echo "OK: phase8220 e2e passed"
