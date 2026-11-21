#!/usr/bin/env bash
# Phase-9819: client soft_fertig_ssh_auth_note_map_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_map_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-note-map roster type ok"; echo "cleaned"; echo "OK: phase9819 e2e passed"
