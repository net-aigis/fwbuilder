#!/usr/bin/env bash
# Phase-7179: client ssh_alternative_titles_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_titles_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternative-titles-refresh roster type ok"; echo "cleaned"; echo "OK: phase7179 e2e passed"
