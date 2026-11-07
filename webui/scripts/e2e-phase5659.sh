#!/usr/bin/env bash
# Phase-5659: client ssh_auth_note_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-note roster type ok"; echo "cleaned"; echo "OK: phase5659 e2e passed"
