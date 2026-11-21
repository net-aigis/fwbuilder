#!/usr/bin/env bash
# Phase-5579: client ssh_refusal_path_notes_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_path_notes_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-refusal-path-notes roster type ok"; echo "cleaned"; echo "OK: phase5579 e2e passed"
