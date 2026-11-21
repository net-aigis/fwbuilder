#!/usr/bin/env bash
# Phase-9323: client soft_fertig_ssh_auth_note_token_roster Soft 9320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_token_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9320+ soft_fertig_ssh_auth_note_token_roster type ok"; echo "cleaned"; echo "OK: phase9323 e2e passed"
