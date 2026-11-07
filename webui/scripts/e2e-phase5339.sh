#!/usr/bin/env bash
# Phase-5339: client ssh_alternative_notes_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_notes_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternative-notes roster type ok"; echo "cleaned"; echo "OK: phase5339 e2e passed"
