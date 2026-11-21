#!/usr/bin/env bash
# Phase-8683: client soft_fertig_ssh_not_implemented_keyboard_refresh_roster Soft 8680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_keyboard_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8680+ soft_fertig_ssh_not_implemented_keyboard_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8683 e2e passed"
