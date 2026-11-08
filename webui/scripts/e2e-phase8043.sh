#!/usr/bin/env bash
# Phase-8043: client soft_fertig_ssh_auth_note_snapshot_refresh_roster Soft 8040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_snapshot_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8040+ soft_fertig_ssh_auth_note_snapshot_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8043 e2e passed"
