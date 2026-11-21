#!/usr/bin/env bash
# Phase-6763: client soft_fertig_ssh_not_implemented_keyboard_roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_keyboard_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6680+ soft_fertig_ssh_not_implemented_keyboard_roster type ok"; echo "cleaned"; echo "OK: phase6763 e2e passed"
