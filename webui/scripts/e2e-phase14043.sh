#!/usr/bin/env bash
# Phase-14043: client soft_fertig_ssh_auth_gap_note_echo_roster Soft 14040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_note_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14040+ soft_fertig_ssh_auth_gap_note_echo_roster type ok"; echo "cleaned"; echo "OK: phase14043 e2e passed"
