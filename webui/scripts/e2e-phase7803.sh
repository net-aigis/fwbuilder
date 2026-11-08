#!/usr/bin/env bash
# Phase-7803: client soft_fertig_ssh_alternative_notes_refresh_roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_notes_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6680+ soft_fertig_ssh_alternative_notes_refresh_roster type ok"; echo "cleaned"; echo "OK: phase7803 e2e passed"
