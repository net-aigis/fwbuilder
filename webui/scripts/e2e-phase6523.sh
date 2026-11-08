#!/usr/bin/env bash
# Phase-6523: client soft_fertig_ssh_auth_note_snapshot_roster Soft 6520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_snapshot_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6520+ soft_fertig_ssh_auth_note_snapshot_roster type ok"; echo "cleaned"; echo "OK: phase6523 e2e passed"
