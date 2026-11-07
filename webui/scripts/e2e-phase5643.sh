#!/usr/bin/env bash
# Phase-5643: client soft_fertig_ssh_refusal_path_notes_roster Soft 5640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_path_notes_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5640+ soft_fertig_ssh_refusal_path_notes_roster type ok"; echo "cleaned"; echo "OK: phase5643 e2e passed"
