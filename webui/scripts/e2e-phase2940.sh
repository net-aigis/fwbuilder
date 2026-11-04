#!/usr/bin/env bash
# Phase-2940: STATUS mentions ssh_honesty_roster / 2937-2944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_honesty_roster|soft_fertig_ssh_honesty_roster' webui/STATUS.md
grep -qE 'phase2944|through 2944|e2e-phase2944' webui/STATUS.md
echo "STATUS SSH honesty roster ok"
echo "cleaned"
echo "OK: phase2940 e2e passed"
