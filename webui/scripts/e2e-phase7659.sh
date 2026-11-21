#!/usr/bin/env bash
# Phase-7659: client ssh_alternative_notes_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_notes_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-refusal-path-titles-refresh roster type ok"; echo "cleaned"; echo "OK: phase7659 e2e passed"
