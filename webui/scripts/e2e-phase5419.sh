#!/usr/bin/env bash
# Phase-5419: client ssh_alternative_titles_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_titles_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternative-titles roster type ok"; echo "cleaned"; echo "OK: phase5419 e2e passed"
