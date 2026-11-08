#!/usr/bin/env bash
# Phase-6491: client surface version + ssh_auth_note_snapshot_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_ssh_auth_note_snapshot_roster?:' webui/frontend/src/api/client.ts
echo "client surface/ssh_auth_note_snapshot_roster types ok"; echo "cleaned"; echo "OK: phase6491 e2e passed"
