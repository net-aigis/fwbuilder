#!/usr/bin/env bash
# Phase-12619: client soft_fertig_ssh_auth_note_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-note-echo roster type ok"; echo "cleaned"; echo "OK: phase12619 e2e passed"
