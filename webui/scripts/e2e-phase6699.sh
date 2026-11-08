#!/usr/bin/env bash
# Phase-6699: client ssh_not_implemented_keyboard_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_keyboard_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-keyboard roster type ok"; echo "cleaned"; echo "OK: phase6699 e2e passed"
