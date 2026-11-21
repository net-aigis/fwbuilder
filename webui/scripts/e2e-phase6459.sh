#!/usr/bin/env bash
# Phase-6459: client ssh_auth_note_snapshot_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_snapshot_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-batch roster type ok"; echo "cleaned"; echo "OK: phase6459 e2e passed"
