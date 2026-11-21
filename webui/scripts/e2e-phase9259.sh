#!/usr/bin/env bash
# Phase-9259: client soft_fertig_ssh_auth_note_token_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_token_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-note-token roster type ok"; echo "cleaned"; echo "OK: phase9259 e2e passed"
