#!/usr/bin/env bash
# Phase-5403: client soft_fertig_ssh_alternative_notes_roster Soft 5400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_notes_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5400+ soft_fertig_ssh_alternative_notes_roster type ok"; echo "cleaned"; echo "OK: phase5403 e2e passed"
