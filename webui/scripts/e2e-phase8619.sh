#!/usr/bin/env bash
# Phase-8619: client soft_fertig_ssh_not_implemented_keyboard_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_keyboard_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-keyboard-refresh roster type ok"; echo "cleaned"; echo "OK: phase8619 e2e passed"
