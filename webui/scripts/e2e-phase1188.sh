#!/usr/bin/env bash
# Phase-1188: STATUS mentions ssh_alternative_titles / 1185-1192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'ssh_alternative_titles|ssh alt titles|ssh_refusal_path_titles' webui/STATUS.md
grep -qE 'phase1192|through 1192|e2e-phase1192' webui/STATUS.md
echo "STATUS ssh titles ok"
echo "cleaned"
echo "OK: phase1188 e2e passed"
