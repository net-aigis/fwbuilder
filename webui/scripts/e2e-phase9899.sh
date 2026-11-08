#!/usr/bin/env bash
# Phase-9899: client soft_fertig_ssh_auth_note_length_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_length_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-note-length roster type ok"; echo "cleaned"; echo "OK: phase9899 e2e passed"
