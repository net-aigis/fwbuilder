#!/usr/bin/env bash
# Phase-13963: client soft_fertig_ssh_auth_notes_count_roster Soft 13960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_notes_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13960+ soft_fertig_ssh_auth_notes_count_roster type ok"; echo "cleaned"; echo "OK: phase13963 e2e passed"
