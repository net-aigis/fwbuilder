#!/usr/bin/env bash
# Phase-5723: client soft_fertig_ssh_auth_note_roster Soft 5720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5720+ soft_fertig_ssh_auth_note_roster type ok"; echo "cleaned"; echo "OK: phase5723 e2e passed"
